### Changing Server Base URL

See https://docs.atlassian.com/confluence/docs-55/Configuring+the+Server+Base+URL for details.

Confluence administration > General configuration
http://localhost:8090/admin/viewgeneralconfig.action

Example:
* Old value: http://localhost:8090
* New value: https://maxlab.polito.it/confluence

Then select "Save".

Also edit server.xml

```
sudo -i
/opt/atlassian/confluence/bin/stop-confluence.sh
vi /opt/atlassian/confluence/conf/server.xml
/opt/atlassian/confluence/bin/start-confluence.sh
```

EOF
