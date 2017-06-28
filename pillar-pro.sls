# vim: ft=yaml
# Custom Pillar Data for rundeck

rundeck:
  enabled: true
  mockup: true
  dep_pkgs:
    - openjdk-8-jre-headless
    - ca-certificates-java
    - uuid-runtime
  dep_fromrepo: jessie-backports
  pro:
    enabled: true
  plugin:
    saltstep:
      enabled: true
    saltgenresource:
      enabled: true
  service:
    name: rundeckd
    enable: true
    state: running
