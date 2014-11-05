<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <Listener className="org.apache.catalina.core.JasperListener" />
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.ServerLifecycleListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <GlobalNamingResources>
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
    {% if JDBC_NAME %}
    <Resource name="{{ JDBC_NAME | default('jdbc/myjdbc') }}"
       type="javax.sql.DataSource"
       url="{{ JDBC_URL | default('jdbc:mysql://localhost/mydb') }}"
       maxActive="30"
       maxWait="5000"
       driverClassName="{{ JDBC_DRIVER_CLASS_NAME | default('com.mysql.jdbc.Driver') }}"
       username="{{ DB_USER | default('root') }}"
       password="{{ DB_PASSWD | default('1234') }}"
       maxIdle="5"
       scope="shareable"
       zeroDateTimeBehavior="convertToNull"
       />
    {% endif %}
  </GlobalNamingResources>
  <Service name="Catalina">
    <Connector port="8080" maxHttpHeaderSize="8192"
               maxThreads="15" minSpareThreads="2" maxSpareThreads="5"
               enableLookups="false" redirectPort="8443" acceptCount="100"
               connectionTimeout="20000" disableUploadTimeout="true" 
               address="0.0.0.0" />
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
      <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
             resourceName="UserDatabase"/>
      <Host name="localhost" appBase="webapps"
       unpackWARs="true" autoDeploy="true"
       xmlValidation="false" xmlNamespaceAware="false">
        <Context path="/"  docBase="/app" debug="1" >
            {% if JDBC_NAME %}
            <ResourceLink  name="{{JDBC_NAME}}" global="{{JDBC_NAME}}"
                type="{{JDBC_TYPE | default('javax.sql.DataSource') }}"/>
            {% endif %}
        </Context>
      </Host>
    </Engine>
  </Service>
</Server>
