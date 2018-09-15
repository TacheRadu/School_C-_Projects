'''
TabbedPanel
============

Test of the widget TabbedPanel.
'''

from kivy.app import App
from kivy.uix.tabbedpanel import TabbedPanel
from kivy.lang import Builder

Builder.load_string("""

<Test>:
    tab_pos: 'top_mid'
    tab_width: root.width / 5
    size_hint: 1.0, 1.0
    pos_hint: {'center_x': .5, 'center_y': .5}
    do_default_tab: False

    TabbedPanelItem:
        text: 'Incasare noua'
        text_size: (root.width  / 5, 40)
        Label:
            text: 'First tab content area'
    TabbedPanelItem:
        text: 'Cheltuiala noua'
        text_size: (root.width  / 5, 40)
        BoxLayout:
            Label:
                text: 'Second tab content area'
            Button:
                text: 'Button that does nothing'
    TabbedPanelItem:
        text: 'Lista venituri'
        text_size: (root.width  / 5, 40)
        RstDocument:
            text:
                '\\n'.join(("Hello world", "-----------",
                "You are in the third tab."))
    TabbedPanelItem:
        text: 'Lista cheltuieli'
        text_size: (root.width  / 5, 40)
    TabbedPanelItem:
        text: 'Lista individuala contributii'
        text_size: (root.width  / 5, 40)
    
""")


class Test(TabbedPanel):
    pass


class TabbedPanelApp(App):
    def build(self):
        return Test()


if __name__ == '__main__':
    TabbedPanelApp().run()