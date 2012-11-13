<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="${createLink(controller: 'home', absolute: true)}webstart">
    <information>
        <title>CodeCanaan</title>
        <vendor>lyhcode</vendor>
        <homepage href="http://codecanaan.com/" />
        <description>CodeCanaan Agent</description>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se" />
        <jar href="lib/webstart-0.0.1.jar" />
        <property name="core.client.port" value="${clientPort}" />
        <property name="core.http.origin" value="*" />
        <property name="core.toolkits.url" value="${resource(dir: 'webstart', file: 'toolkits.zip', absolute: true)}" />
        <property name="core.script.type" value="groovy" />
        <property name="core.script.url" value="${resource(dir: 'webstart', file: 'agent.groovy', absolute: true)}" />
    </resources>
    <application-desc main-class="com.lyhdev.gws.ScriptLoader" />
</jnlp>