{% from "bit_standard_apps/map.jinja" import config with context %}

install_standard_apps:
  pkg.installed:
  - pkgs:
  {% if config.include_standard == True %}
  {% for app in config.standard_apps %}
  - {{ app }}
  {% endfor %}
  {% endif %}

  {% for app in config.extra %}
  - {{ app }}
  {% endfor %}