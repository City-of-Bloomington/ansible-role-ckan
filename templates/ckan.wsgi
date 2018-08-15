import os
activate_this = '{{ ckan_path }}/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))

from paste.deploy import loadapp
config_filepath = "{{ ckan_path }}/etc/production.ini"
from paste.script.util.logging_config import fileConfig
fileConfig(config_filepath)
application = loadapp('config:%s' % config_filepath)
