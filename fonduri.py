import psycopg2
from kivy.app import App
from functools import partial
from kivy.lang import Builder
from kivy.uix.button import Button
from kivy.uix.dropdown import DropDown
from kivy.uix.textinput import TextInput
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
    
""")
def getConnection():

        db = psycopg2.connect("dbname='fondul_clasei' user='johnnyt' host='localhost'")
        return db

def insertIntoTable(self, suma, nume):
    user = nume 
    try:
        int_val = int(suma) # or flt_val = float(str_float)
    except ValueError:
        return -1
    
    while user.find(' ') != -1:
        user = user[0].lower() + user[1:user.find(' ')] + '_' + user[user.find(' ') + 1].lower() + user[user.find(' ') + 2:]
    db = getConnection()
    cur = db.cursor()
    print 'it got into insertIntoTable, with user = ' + user
    cur.execute("INSERT INTO " + user + " (suma, data) VALUES(%(int)s, current_date);", int_val)
    db.commit()
    db.close()
    updateTable(nume, user)

class TabbedApp(TabbedPanel):
    pass

class TabbedPanelApp(App):
    mainbutton = Button(text='Nume contribuitor', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.625, 'center_y': 0.85})
    dropdown = DropDown()
    fonduri = TabbedApp()
    incasare = TabbedPanelItem()
    incasare_box = FloatLayout()
    submit = Button(text = 'Submit', size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.5, 'center_y': 0.5})
    suma = TextInput(text='suma', multiline = False, size_hint = (0.25, None), height = 40, pos_hint = {'center_x': 0.25, 'center_y': 0.85})
    def updateTable(self, nume, user):
        print 'it should have inserted into the users table by now...'
        db = getConnection()
        cur = db.cursor()
        cur.execute("UPDATE lista SET suma = (SELECT SUM(suma) FROM " + user + ") WHERE nume = '" + nume + "';")
        db.commit()
        db.close()

    def insertIntoTable(self, instance):
        nume = self.mainbutton.text
        suma = self.suma.text
        user = nume 
        try:
            int_val = int(suma) # or flt_val = float(str_float)
        except ValueError:
            return -1
        
        while user.find(' ') != -1:
            user = user[0].lower() + user[1:user.find(' ')] + '_' + user[user.find(' ') + 1].lower() + user[user.find(' ') + 2:]
        db = getConnection()
        cur = db.cursor()
        print 'it got into insertIntoTable, with user = ' + user
        cur.execute("INSERT INTO " + user + " (suma, data) VALUES(%s, current_date);", [int_val])
        db.commit()
        db.close()
        self.updateTable(nume, user)
        
    def build(self):
        self.incasare.text = 'Incasare noua'
        self.incasare.text_size = (self.fonduri.width, 40)
        db = getConnection()
        cur = db.cursor()
        cur.execute("""SELECT * FROM lista
                        ORDER BY nume ASC;""")
        for row in cur.fetchall():
            btn = Button(text= row[0], size_hint_y=None, height=44)
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
        self.fonduri.add_widget(self.incasare)
        return self.fonduri


if __name__ == '__main__':
    TabbedPanelApp().run()