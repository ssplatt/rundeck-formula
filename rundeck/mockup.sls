# vim: ft=sls
{% from "rundeck/map.jinja" import rundeck with context %}

jessie_backports_repo_managed:
  pkgrepo.managed:
    - humanname: Jessie Backports
    - name: deb http://ftp.debian.org/debian jessie-backports main
    - file: /etc/apt/sources.list.d/jessie-backports.list

{% if not rundeck.pro.enabled %}
rundeck_mockup_repo:
  pkgrepo.managed:
    - humanname: Rundeck Bintray Repo
    - name: deb https://dl.bintray.com/rundeck/rundeck-deb /
    - file: /etc/apt/sources.list.d/rundeck.list
    - key_url: https://raw.githubusercontent.com/jacekkow/docker-rundeck/master/bintray-gpg.key
    - refresh_db: true
{% endif %}
