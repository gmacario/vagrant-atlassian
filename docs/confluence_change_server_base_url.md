### Changing Server Base URL

See https://docs.atlassian.com/confluence/docs-55/Configuring+the+Server+Base+URL for details.

Confluence administration > General configuration

http://localhost:8090/admin/viewgeneralconfig.action

Example:
* Old value: http://localhost:8090
* New value: https://maxlab.polito.it/confluence

Then select "Save".

Then stop Confluence and edit server.xml

```
$ sudo -i
# /opt/atlassian/confluence/bin/stop-confluence.sh
# cd /opt/atlassian/confluence/conf
# cp server.xml server.xml.ORIG
# vi server.xml
```

Example (in case the Server Base URL was moved to "/confluence"):

```
root@336f4ab90831:~# diff -uw /opt/atlassian/confluence/conf/server.xml.ORIG  /opt/atlassian/confluence/conf/server.xml      
--- /opt/atlassian/confluence/conf/server.xml.ORIG	2014-11-16 10:34:11.302643552 +0000
+++ /opt/atlassian/confluence/conf/server.xml	2014-11-16 10:34:24.106643075 +0000
@@ -8,7 +8,7 @@
 
             <Host name="localhost" debug="0" appBase="webapps" unpackWARs="true" autoDeploy="false">
 
-                <Context path="" docBase="../confluence" debug="0" reloadable="false" useHttpOnly="true">
+                <Context path="/confluence" docBase="../confluence" debug="0" reloadable="false" useHttpOnly="true">
                     <!-- Logger is deprecated in Tomcat 5.5. Logging configuration for Confluence is specified in confluence/WEB-INF/classes/log4j.properties -->
                     <Manager pathname="" />
                 </Context>
root@336f4ab90831:~#
```

Finally, restart Confluence:

```
# /opt/atlassian/confluence/bin/start-confluence.sh
```

EOF
