<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
${message!?html}
<#if sysconfig.isDevMode()>
<p>
${detail!?html}
</p>
</#if>
</@we.html>