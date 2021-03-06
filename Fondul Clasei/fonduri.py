import psycopg2
from kivy.app import App
from kivy.lang import Builder
from kivy.uix.popup import Popup
from kivy.uix. label import Label
from kivy.uix.button import Button
from kivy.core.window import Window
from kivy.uix.dropdown import DropDown
from kivy.uix.textinput import TextInput
from kivy.uix.gridlayout import GridLayout
from kivy.uix.scrollview import ScrollView
from kivy.uix.stacklayout import StackLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.tabbedpanel import TabbedPanel
from kivy.uix.tabbedpanel import TabbedPanelItem


Builder.load_string("""
<TabbedApp>:
    tab_pos: 'top_mid'
    tab_width: root.width / 5
    size_hint: 1.0, 1.0
    pos_hint: {'center_x': .5, 'center_y': .5}
    do_default_tab: False
<DBEntries>:
    orientation: "vertical"
    size_hint_y: None
    height: self.minimum_height
    row_default_height: 40
<ContributionLabel>:
    background_color: 0, 1, 0, .3
    canvas.before:
        Color:
            rgba: self.background_color
        Rectangle:
            pos: self.pos
            size: self.size
<SpendingsLabel>:
    background_color: 1, 0, 0, .5
    canvas.before:
        Color:
            rgba: self.background_color
        Rectangle:
            pos: self.pos
            size: self.size
<TotalLabel>:
    background_color: 0, 0, 1, .3
    canvas.before:
        Color:
            rgba: self.background_color
        Rectangle:
            pos: self.pos
            size: self.size
<RefreshButton>:
    Image:
        source: 'refresh-icon.png'
        y: self.parent.y + 5
        x: self.parent.x + 5
        size: self.parent.width - 10, self.parent.height - 10
        allow_stretch: True
""")

def getConnection():

        db = psycopg2.connect("dbname='fondul_clasei' user='johnnyt' host='localhost'")
        return db

class RefreshButton(Button):
    pass

class ContributionLabel(Label):
    pass

class SpendingsLabel(Label):
    pass

class TotalLabel(Label):
    pass

class DBEntries(GridLayout):
    pass

class TabbedApp(TabbedPanel):
    pass

class IncasarePanel(TabbedPanelItem):
    mainbutton = Button(text='Nume contribuitor', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.625, 'center_y': 0.85})
    dropdown = DropDown()
    incasare = TabbedPanelItem()
    incasare_box = FloatLayout()
    popup = Popup(size_hint =(0.9, 0.15), pos_hint = {'center_x': 0.5, 'center_y': 0.1})
    submit = Button(text = 'Submit', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.5, 'center_y': 0.5})
    suma = TextInput(hint_text='Suma', multiline = False, size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.25, 'center_y': 0.85})
    
    def updateTable(self, nume, user):
        db = getConnection()
        cur = db.cursor()
        cur.execute("UPDATE lista SET suma = (SELECT SUM(suma) FROM " + user + ") WHERE nume = '" + nume + "';")
        cur.execute("UPDATE lista SET ultima_contributie = (SELECT MAX(data) FROM " + user + ") WHERE nume = '" + nume + "' ;")
        db.commit()
        db.close()

    def insertIntoTable(self, instance):
        nume = self.mainbutton.text
        suma = self.suma.text
        user = nume 
        if nume != 'Nume contribuitor':
            while user.find(' ') != -1:
                user = user[0].lower() + user[1:user.find(' ')] + '_' + user[user.find(' ') + 1].lower() + user[user.find(' ') + 2:]
            try:
                db = getConnection()
                cur = db.cursor()
                cur.execute("INSERT INTO " + user + " (id, suma, data) VALUES(nextval('" + user + "_sequence'), %s, current_date);", [suma])
                db.commit()
                self.popup.separator_color = (0, 1, 0, 1)
                self.popup.title = 'Success'
                self.popup.content = Label(text = 'Updated Database successfully.')
            except psycopg2.DatabaseError:
                self.popup.separator_color = (1, 0, 0, 1)
                self.popup.title = 'Error'
                self.popup.content = Label(text = 'Failed to update Database.')
            finally:
                db.close()
                self.updateTable(nume, user)
                self.popup.open()
        else:
            self.popup.separator_color = (1, 0, 0, 1)
            self.popup.title = 'Error'
            self.popup.content = Label(text = 'Select a user first.')
            self.popup.open()
        
    def __init__(self):
        self.incasare.text = 'Incasare noua'
        self.incasare.text_size = (self.incasare.width, self.incasare.height)
        db = getConnection()
        cur = db.cursor()
        cur.execute("""SELECT * FROM lista
                        ORDER BY nume ASC;""")
        for row in cur.fetchall():
            btn = Button(text= row[1], size_hint_y=None, height=44)
            btn.bind(on_release=lambda btn: self.dropdown.select(btn.text))
            btn.x = 0
            btn.y = 0
            self.dropdown.add_widget(btn)
        db.close()
        self.mainbutton.bind(on_release=self.dropdown.open)
        self.dropdown.bind(on_select=lambda instance, x: setattr(self.mainbutton, 'text', x))
        self.submit.bind(on_release=self.insertIntoTable)
        self.incasare_box.add_widget(self.mainbutton)
        self.incasare_box.add_widget(self.suma)
        self.incasare_box.add_widget(self.submit)
        self.incasare.add_widget(self.incasare_box)
    
    def build(self):
        return self.incasare

class ListaPanel(TabbedPanelItem):
    updateState = ''
    lista = TabbedPanelItem(text = 'Lista contributii')
    bigView = StackLayout(orientation = 'rl-tb')
    top_buttons = GridLayout(cols = 3, row_default_height=40, size_hint=(1, None), height = 40)
    db_entries = DBEntries(cols = 3)
    scroll = ScrollView(size_hint=(1, None), size=(Window.width, Window.height - 126)) # to make up for the tabs above and the padding
    
    def updateByButton(self, button):
        if(self.updateState != button[0].lower() + button[1:] + "_ASC"):
            self.updateState = button[0].lower() + button[1:] + "_ASC"
        else:
            self.updateState = button[0].lower() + button[1:] + "_DESC"
        self.updateView()
    
    def updateView(self):
        self.db_entries.clear_widgets()
        db = getConnection()
        cur = db.cursor()
        if(self.updateState == ''):
            cur.execute("SELECT * FROM lista;")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(ContributionLabel(text = str(col)))
        elif(self.updateState[0:4] != 'data'):
            cur.execute("SELECT * FROM lista ORDER BY " + self.updateState[0:4] + " " + self.updateState[5:] + ";")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(ContributionLabel(text = str(col)))
        else:
            cur.execute("SELECT * FROM lista ORDER BY ultima_contributie " + self.updateState[5:] + ";")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(ContributionLabel(text = str(col)))
        self.db_entries.add_widget(SpendingsLabel(text = 'Cheltuieli'))
        cur.execute("SELECT SUM(suma) FROM cheltuieli;")
        cheltuieli = cur.fetchall()[0][0]
        self.db_entries.add_widget(SpendingsLabel(text = str(cheltuieli)))
        cur.execute("SELECT MAX(data) FROM cheltuieli;")
        self.db_entries.add_widget(SpendingsLabel(text = str(cur.fetchall()[0][0])))
        self.db_entries.add_widget(TotalLabel(text = 'Total'))
        cur.execute("SELECT SUM(suma) FROM lista;")
        self.db_entries.add_widget(TotalLabel(text = str(cur.fetchall()[0][0] - cheltuieli)))
        cur.execute("""SELECT MAX(data) FROM (
            SELECT data FROM cheltuieli 
            WHERE data = (
                SELECT MAX(data) FROM cheltuieli)
            UNION
            SELECT ultima_contributie AS data FROM lista 
            WHERE ultima_contributie = (
                SELECT MAX(ultima_contributie) FROM lista)) AS latest_date;"""
        )
        self.db_entries.add_widget(TotalLabel(text = str(cur.fetchall()[0][0])))
    
    def __init__(self):
        self.top_buttons.add_widget(Button(on_press = lambda btn: self.updateByButton(btn.text), text = 'Nume'))
        self.top_buttons.add_widget(Button(on_press = lambda btn: self.updateByButton(btn.text), text = 'Suma'))
        self.top_buttons.add_widget(Button(on_press = lambda btn: self.updateByButton(btn.text), text = 'Data'))
        self.bigView.add_widget(RefreshButton(on_press = lambda btn: self.updateView(), text = '', size_hint = (None, None), height = 40, width = 40))
        self.bigView.add_widget(self.top_buttons)
        self.updateView()
        self.scroll.add_widget(self.db_entries)
        self.bigView.add_widget(self.scroll)
        self.lista.add_widget(self.bigView)

class CheltuialaPanel(TabbedPanelItem):
    submit = Button(text = 'Submit', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.6, 'center_y': 0.5})
    suma = TextInput(hint_text='Suma', multiline = False, size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.3, 'center_y': 0.5})
    cheltuiala = TabbedPanelItem()
    cheltuialaBox = FloatLayout()
    popup = Popup(separator_color = (0, 1, 0, 1),title = 'Success', size_hint =(0.9, 0.15), pos_hint = {'center_x': 0.5, 'center_y': 0.1}, content = Label(text = 'Updated Database successfully.'))
    
    def insertIntoTable(self, instance):
        suma = self.suma.text
        if suma != '':
            try:
                db = getConnection()
                cur = db.cursor()
                cur.execute("INSERT INTO cheltuieli(id, suma, data) VALUES (nextval('cheltuieli_sequence'), " + suma + ", current_date);")
                db.commit()
                self.popup.separator_color = (0, 1, 0, 1)
                self.popup.title = 'Success'
                self.popup.content = Label(text = 'Updated Database successfully.')
            except psycopg2.DatabaseError:
                self.popup.separator_color = (1, 0, 0, 1)
                self.popup.title = 'Error'
                self.popup.content = Label(text = 'Failed to update Database.')
            finally:
                db.close()
                self.popup.open()
        else:
            self.popup.separator_color = (1, 0, 0, 1)
            self.popup.title = 'Error'
            self.popup.content = Label(text = 'Insert a value first.')
            self.popup.open()

    def __init__(self):
        self.cheltuiala.text = 'Cheltuiala noua'
        self.submit.bind(on_release = self.insertIntoTable)
        self.cheltuialaBox.add_widget(self.suma)
        self.cheltuialaBox.add_widget(self.submit)
        self.cheltuiala.add_widget(self.cheltuialaBox)
    
    def build(self):
        pass

class ListaCheltuieliPanel(TabbedPanelItem):
    updateState = ''
    lista = TabbedPanelItem(text = 'Lista cheltuieli')
    bigView = StackLayout(orientation = 'rl-tb')
    top_buttons = GridLayout(cols = 2, row_default_height=40, size_hint=(1, None), height = 40)
    db_entries = DBEntries(cols = 2)
    scroll = ScrollView(size_hint=(1, None), size=(Window.width, Window.height - 126))
    def updateByButton(self, button):
        if(self.updateState != button[0].lower() + button[1:] + "_ASC"):
            self.updateState = button[0].lower() + button[1:] + "_ASC"
        else:
            self.updateState = button[0].lower() + button[1:] + "_DESC"
        self.updateView()
    
    def updateView(self):
        self.db_entries.clear_widgets()
        db = getConnection()
        cur = db.cursor()
        if(self.updateState == ''):
            cur.execute("SELECT * FROM cheltuieli;")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(SpendingsLabel(text = str(col)))
        else:
            cur.execute("SELECT * FROM cheltuieli ORDER BY " + self.updateState[0:4] + " " + self.updateState[5:] + ";")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(SpendingsLabel(text = str(col)))
        self.db_entries.add_widget(TotalLabel(text = 'Total'))
        cur.execute("SELECT SUM(suma) FROM cheltuieli;")
        self.db_entries.add_widget(TotalLabel(text = str(cur.fetchall()[0][0])))

    def __init__(self):
        self.top_buttons.add_widget(Button(on_press = lambda btn: self.updateByButton(btn.text), text = 'Suma'))
        self.top_buttons.add_widget(Button(on_press = lambda btn: self.updateByButton(btn.text), text = 'Data'))
        self.updateView()
        self.bigView.add_widget(RefreshButton(on_press = lambda btn: self.updateView(), text = '', size_hint = (None, None), height = 40, width = 40))
        self.bigView.add_widget(self.top_buttons)
        self.bigView.add_widget(self.db_entries)
        self.lista.add_widget(self.bigView)

class ListaIndividuala(TabbedPanelItem):
    updateState = ''
    panel = TabbedPanelItem(text = 'Lista Contributii Individuale')
    bigView = StackLayout(orientation = 'rl-tb')
    popup = Popup(size_hint =(0.9, 0.15), pos_hint = {'center_x': 0.5, 'center_y': 0.1})
    refresh = RefreshButton(text = '', size_hint = (None, None), height = 40, width = 40)
    contribuitor = Button(text='Nume contribuitor', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.625, 'center_y': 0.85})
    dropdown = DropDown()
    topButtons = DBEntries(cols = 2)
    dbEntries = DBEntries(cols = 2)
    scroll = ScrollView()
    
    def setContribuitorName(self, name):
        self.contribuitor.text = name
        self.updateList()
    
    def updateView(self, btn):
        if btn.text != '':
            if self.updateState != btn.text[0].lower() + btn.text[1:] + '_ASC':
                self.updateState = btn.text[0].lower() + btn.text[1:] + '_ASC'
            else:
                self.updateState = btn.text[0].lower() + btn.text[1:] + '_DESC'
        self.updateList()

    def updateList(self):
        db = getConnection()
        cur = db.cursor()
        nume = self.contribuitor.text
        user = nume[0].lower() + nume[1:nume.find(' ')] + '_' + nume[nume.find(' ') + 1].lower() + nume[nume.find(' ') + 2:]
        if nume != 'Nume contribuitor':
            self.dbEntries.clear_widgets()
            if self.updateState != '':
                cur.execute("SELECT * FROM " + user + " ORDER BY " + self.updateState[0:4] + " " + self.updateState[5:])
                for row in cur.fetchall():
                    self.dbEntries.add_widget(ContributionLabel(text = str(row[1])))
                    self.dbEntries.add_widget(ContributionLabel(text = str(row[2])))
                self.dbEntries.add_widget(TotalLabel(text = 'Total'))
                cur.execute("SELECT SUM(suma) FROM " + user)
                self.dbEntries.add_widget(TotalLabel(text = str(cur.fetchall()[0][0])))
            else:
                cur.execute('SELECT * FROM ' + user + ' ORDER BY data ASC')
                for row in cur.fetchall():
                    self.dbEntries.add_widget(ContributionLabel(text = str(row[1])))
                    self.dbEntries.add_widget(ContributionLabel(text = str(row[2])))
                self.dbEntries.add_widget(TotalLabel(text = 'Total'))
                cur.execute("SELECT SUM(suma) FROM " + user)
                self.dbEntries.add_widget(TotalLabel(text = str(cur.fetchall()[0][0])))
        else:
            self.popup.separator_color = (1, 0, 0, 1)
            self.popup.title = 'Error'
            self.popup.content = Label(text = 'Select a user first')
            self.popup.open()
        db.close()


    def setDropDown(self):
        db = getConnection()
        cur = db.cursor()
        cur.execute("""SELECT * FROM lista
                        ORDER BY nume ASC;""")
        for row in cur.fetchall():
            btn = Button(text= row[1], size_hint_y=None, height=40)
            btn.bind(on_release=lambda btn: self.dropdown.select(btn.text))
            btn.x = 0
            btn.y = 0
            self.dropdown.add_widget(btn)
        db.close()
        self.contribuitor.bind(on_release=self.dropdown.open)
        self.dropdown.bind(on_select=lambda instance, x: self.setContribuitorName(x))
    
    def __init__(self):
        self.panel.text_size = (None, self.panel.height)
        self.refresh.bind(on_press = self.updateView)
        self.setDropDown()
        self.topButtons.add_widget(Button(text = 'Suma', on_press = self.updateView))
        self.topButtons.add_widget(Button(text = 'Data', on_press = self.updateView))
        self.bigView.add_widget(self.refresh)
        self.bigView.add_widget(self.contribuitor)
        self.bigView.add_widget(self.topButtons)
        self.bigView.add_widget(self.dbEntries)
        self.panel.add_widget(self.bigView)


class TabbedPanelApp(App):
    incasarePanel = IncasarePanel()
    cheltuialaPanel = CheltuialaPanel()
    listaPanel = ListaPanel()
    listaCheltuieliPanel = ListaCheltuieliPanel()
    listaIndividuala  = ListaIndividuala()
    fonduri = TabbedApp()
    
    def resizeWindow(self, window, width, height):
        self.listaPanel.scroll.size = (width, height - 126)
        self.listaCheltuieliPanel.scroll.size = (width, height - 126)
        self.listaIndividuala.scroll.size = (width, height - 126)

    def build(self):
        Window.bind(on_resize = self.resizeWindow)
        self.fonduri.add_widget(self.incasarePanel.incasare)
        self.fonduri.add_widget(self.cheltuialaPanel.cheltuiala)
        self.fonduri.add_widget(self.listaPanel.lista)
        self.fonduri.add_widget(self.listaCheltuieliPanel.lista)
        self.fonduri.add_widget(self.listaIndividuala.panel)
        return self.fonduri

if __name__ == '__main__':
    TabbedPanelApp().run()