from myfedora.plugins.views.view import BaseViewController
from myfedora.lib.app_factory import ViewAppFactory

#from myfedora.widgets import ViewWidget

from tw.jquery import jquery_js, jQuery
from tw.api import Widget, JSLink, js_function, js_callback

import pylons

class PackagesViewApp(ViewAppFactory):
    entry_name = 'packages'

class ViewWidget(Widget):
    params = ['']
    template = 'genshi:myfedora.plugins.views.templates.view'
    javascript = [jquery_js]
    data = None
    event_cb = None

    def update_params(self, d):
        if d.get('tool', None):
            active_tool = self[d['tool']]
            d[active_tool]['active'] = True 
             
        super(ViewWidget, self).update_params(d)
