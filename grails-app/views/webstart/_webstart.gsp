<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="${baseURL}/webstart">
    <information>
        <title>CodeCanaan</title>
        <vendor>lyhcode</vendor>
        <homepage href="http://codecanaan.com/" />
        <description>CodeCanaan ClientTools</description>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se" />
        <jar href="http://assets${serverId}.codecanaan.com/webstart/ClientTools.jar" />
        <property name="core.client.port" value="${clientPort}" />
        <property name="core.http.origin" value="*" />
        <property name="core.toolkits.url" value="http://assets.codecanaan.com/webstart/toolkits.zip" />
        <property name="core.script.type" value="groovy" />
        <property name="core.script.url" value="${createLink(controller:'webstart',action:'script',absolute:true)}" />
    </resources>
    <application-desc main-class="com.codecanaan.ScriptLoader" />
</jnlp>
