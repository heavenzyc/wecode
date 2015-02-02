<#macro breadcrumb current="">
<#if menuPath?has_content>
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
    </script>

    <ul class="breadcrumb">
        <#list menuPath as m>
        <#if m_has_next>
        <li>
            <#if m_index==0><i class="icon-home home-icon"></i></#if>
            <a href="${m.entry_url}">${m.name!?html}</a>
        </li>
        <#else>
            <#if current!="">
        <li><a href="${m.entry_url}">${m.name!?html}</a></li>
            <#else>
        <li class="active">${m.name!?html}</li>
            </#if>
        </#if>
        </#list>
        <#if current!="">
        <li class="active">${current?html}</li>
        </#if>
    </ul><!-- .breadcrumb -->
</div>
</#if>
</#macro>