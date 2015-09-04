Docker tomcat6 legacy app server
================================

Legacy Tomcat6 / Java6 app server

Usage
-----

Mount your java app on /app, or inherit from your Dockerfile and ADD /app

::

    docker run -e MANAGER_USER=admin -e MANAGER_PASSWORD=1234 -v /workspace/my_app:/app -p 8080:8080 apsl/tomcat6


Description
-----------

* Parent: apsl/java6. 
* Based on apsl/circusbase https://registry.hub.docker.com/u/apsl/circusbase/
  * circus for process management
  * envtpl for variables
* Tomcat configurable from env vars (with envtpl)
* Tomcat process managed by circus http://circus.readthedocs.org 
 
Env vars: 
---------

Tomcat manager user / passwd::

    -e MANAGER_USER=admin
    -e MANAGER_PASSWORD=yourpasswd

JAVA_OPTS::

    -e JAVA_OPTS=-Xms=512m


And other options from apsl/circusbase: https://registry.hub.docker.com/u/apsl/circusbase/
