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

{% if config.choco %}
"Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))":
  cmd.run:
    - shell: powershell
    - unless:
      - where chocola*
{% for app in config.choco %}
install_{{ app }}:
  chocolatey.install:
  - name: {{ app }}
{% endfor %}
{% endif %}
