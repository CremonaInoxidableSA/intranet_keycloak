<#macro renderFavicons favicons resourcesPath>
    <#list favicons as favicon>
        <link rel="icon" href="${resourcesPath}/img/${favicon.name}" sizes="${favicon.size}" type="${favicon.type}">
    </#list>
</#macro>

<#macro renderStyles styles resourcesPath>
    <#list styles as style>
        <link href="${resourcesPath}/${style}" rel="stylesheet" />
    </#list>
</#macro>

<#macro renderScripts scripts resourcesPath type>
    <#list scripts as script>
        <script src="${resourcesPath}/${script}" type="${type}"></script>
    </#list>
</#macro>
