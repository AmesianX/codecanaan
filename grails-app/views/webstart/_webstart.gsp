<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="${baseURL}/webstart">
    <information>
        <title>CodeCanaan</title>
        <vendor>lyhcode</vendor>
        <!--<icon href="*" />-->
        <homepage href="http://codecanaan.com/" />
        <description>CodeCanaan ClientTools</description>
        <offline-allowed />
        <shortcut online="false" install="false">
            <desktop/>
            <menu submenu="CodeCanaan Apps"/>
        </shortcut>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se" java-vm-args="-esa -Xnoclassgc" />
        <jar href="http://assets${serverId}.codecanaan.com/webstart/ClientTools.jar" />
        <!--<jar href="ClientTools.jar" />-->
        <property name="javaws.core.client.port" value="${clientPort}" />
        <property name="javaws.core.http.origin" value="*" />
        <property name="javaws.core.toolkits.url" value="http://assets${serverId}.codecanaan.com/webstart/toolkits.zip" />
        <property name="javaws.core.script.type" value="groovy" />
        <property name="javaws.core.script.url" value="${createLink(controller:'webstart',action:'script',absolute:true)}" />
        <property name="javaws.core.client.mode" value="${mode}" />
        <property name="javaws.core.exam.url" value="${createLink(controller:'home',action:'exam',absolute:true)}" />
    </resources>
    <application-desc main-class="com.codecanaan.ScriptLoader" />
</jnlp>
<%-- http://docs.oracle.com/javase/7/docs/technotes/guides/javaws/developersguide/syntax.html --%>
