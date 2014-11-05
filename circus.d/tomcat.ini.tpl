[env:tomcat]
JAVA_OPTS = {{JAVA_OPTS  | default('-Xms128m -Xmx3072m -XX:MaxPermSize=256m') }}
 
[watcher:tomcat]
cmd = /opt/tomcat/bin/tomcat_wrapper.sh
copy_env = True
use_sockets = False
singleton = True
