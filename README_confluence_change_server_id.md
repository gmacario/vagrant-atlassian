### Changing Confluence Server ID

Before starting Confluence setup you may optionally change the Server ID to match the one of your production Confluence server.

See https://confluence.atlassian.com/display/CONFKB/How+to+Change+the+Server+ID+of+Confluence for details.

Execute the following commands when logged in **as root** on the guest VM.

```language="bash"
# Stop Confluence
/opt/atlassian/confluence/bin/stop-confluence.sh

vi /var/atlassian/application-data/confluence/confluence.cfg.xml
# Search and replace value of property "confluence.setup.server.id"

# Start Confluence
/opt/atlassian/confluence/bin/start-confluence.sh
```

Then browse http://localhost:8090/ and setup Confluence.

EOF
