import psycopg2
from kivy.app import App
from functools import partial
from kivy.lang import Builder
from kivy.uix.popup import Popup
from kivy.uix. label import Label
from kivy.uix.button import Button
from kivy.uix.dropdown import DropDown
from kivy.uix.textinput import TextInput
from kivy.uix.boxlayout import BoxLayout
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
    cols:3
<BackgroundLabel>:
    background_color: 1, 0, 0, .3
    canvas.before:
        Color:
            rgba: self.background_color
        Rectangle:
            pos: self.pos
            size: self.size
<RefreshButton>:
    text: "B1"
    Image:
        source: 'refresh-icon.png'
        y: self.parent.y
        x: self.parent.x
        size: 40, 40
        allow_stretch: True
""")
def getConnection():

        db = psycopg2.connect("dbname='fondul_clasei' user='johnnyt' host='localhost'")
        return db
class RefreshButton(Button):
    pass
class BackgroundLabel(Label):
    def choosecolor(self):
        self.background_color = (0, 1, 0, .4)
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
    popup = Popup(separator_color = (0, 1, 0, 1), title = 'Success', size_hint =(0.9, 0.15), pos_hint = {'center_x': 0.5, 'center_y': 0.1}, content = Label(text = 'Database updated successfully.'))
    submit = Button(text = 'Submit', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.5, 'center_y': 0.5})
    suma = TextInput(hint_text='Suma', multiline = False, size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.25, 'center_y': 0.85})
    def updateTable(self, nume, user):
        db = getConnection()
        cur = db.cursor()
        cur.execute("UPDATE lista SET suma = (SELECT SUM(suma) FROM " + user + ") WHERE nume = '" + nume + "';")
        cur.execute("UPDATE lista SET ultima_contributie = (SELECT data FROM " + user + " ORDER BY data DESC LIMIT 1) WHERE nume = '" + nume + "' ;")
        db.commit()
        db.close()

    def insertIntoTable(self, instance):
        nume = self.mainbutton.text
        suma = self.suma.text
        user = nume 
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
    bigView = BoxLayout(orientation = 'vertical')
    top_buttons = GridLayout(cols = 3, row_default_height=40, size_hint=(1, None), height = 40)
    db_entries = DBEntries()
    scroll = ScrollView()
    def update(self, instance):
        if(self.updateState == ''):
            self.db_entries.clear_widgets()
            db = getConnection()
            cur = db.cursor()
            cur.execute("SELECT * FROM lista")
            for row in cur.fetchall():
                for col in row[1:]:
                    self.db_entries.add_widget(BackgroundLabel(text = str(col)))
    def __init__(self):
        self.top_buttons.add_widget(Button(text = 'Nume'))
        self.top_buttons.add_widget(Button(text = 'Suma'))
        self.top_buttons.add_widget(Button(text = 'Data'))
        db = getConnection()
        cur = db.cursor()
        cur.execute("SELECT * FROM lista;")
        for row in cur.fetchall():
            for col in row[1:]:
                self.db_entries.add_widget(BackgroundLabel(text = str(col)))
        self.db_entries.add_widget(BackgroundLabel(text = ''))
        self.bigView.add_widget(RefreshButton(on_press = self.update, text = '', size_hint = (None, None), height = 40, width = 40))
        self.bigView.add_widget(self.top_buttons)
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
    def __init__(self):
        self.cheltuiala.text = 'Cheltuiala noua'
        self.cheltuiala.text_size = (self.cheltuiala.width, self.cheltuiala.height)
        self.submit.bind(on_release = self.insertIntoTable)
        self.cheltuialaBox.add_widget(self.suma)
        self.cheltuialaBox.add_widget(self.submit)
        self.cheltuiala.add_widget(self.cheltuialaBox)
    def build(self):
        pass
class TabbedPanelApp(App):
    incasarePanel = IncasarePanel()
    cheltuialaPanel = CheltuialaPanel()
    listaPanel = ListaPanel()
    fonduri = TabbedApp()
    def build(self):
        self.fonduri.add_widget(self.incasarePanel.incasare)
        self.fonduri.add_widget(self.cheltuialaPanel.cheltuiala)
        self.fonduri.add_widget(self.listaPanel.lista)
        return self.fonduri

if __name__ == '__main__':
    TabbedPanelApp().run()