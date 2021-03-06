<title>[[++romanesco.title_format]]</title>

<meta charset="[[++modx_charset]]">
<meta name="description" content="[[*description]]">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

[[$openGraphMeta]]

<base href="[[!++site_url]]">

<script>document.documentElement.className = 'js';</script>

[[++minify_css_js:eq=`1`:then=`.min`:toPlaceholder=`minify`]]
[[modifiedIf?
    &subject=`[[++critical_css]]_[[*critical_css_uri:notempty=`1`]]`
    &operator=`eq`
    &operand=`1_1`
    &then=`1`
    &toPlaceholder=`load_critical_css`
]]
[[[[If?
    &subject=`[[++cache_buster]]`
    &operator=`eq`
    &operand=`1`
    &then=`$cacheBusterPlaceholders`
]]]]
[[[[modifiedIf?
    &subject=`headPreloadLinksTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$headPreloadLinksTheme`
    &else=`$headPreloadLinks`
]]]]

[[+load_critical_css:eq=`1`:then=`
<link href="[[*critical_css_uri:replace=`.css==[[+cache_buster_css]].css`]]" rel="stylesheet">
<link href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css" rel="stylesheet" media="print" onload="this.media='all'">
<link href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css" rel="stylesheet" media="print" onload="this.media='all'">
`:else=`
<link href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css" rel="stylesheet">
<link href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css" rel="stylesheet">
`]]

[[- SET CONDITIONS FOR LOADING ADDITIONAL ASSETS ]]
[[~[[*id]]:contains=`status`:or:contains=`hub`:then=`1`:toPlaceholder=`load_assets_hub`]]
[[cbHasFields:toPlaceholder=`load_assets_map`? &field=`[[++romanesco.cb_field_map_id]]` &then=`1`]]
[[modifiedIf?
    &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_code_id]]` &then=`1`]][[*context_key:is=`notes`:then=`1`]][[*uri:contains=`notes/`:then=`1`]]`
    &operator=`notempty`
    &then=`1`
    &toPlaceholder=`load_syntax_highlighting`
]]

[[[[+load_assets_map:eq=`1`:then=`$mapLoadAssets`]]]]
[[+load_assets_hub:eq=`1`:then=`
<link href="[[++romanesco.semantic_dist_path]]/components/modal[[+cache_buster_css]].css" rel="stylesheet">
<link href="[[++romanesco.semantic_dist_path]]/components/step[[+cache_buster_css]].css" rel="stylesheet">
`]]
[[+load_syntax_highlighting:eq=`1`:then=`
<link href="[[++romanesco.semantic_vendor_path]]/prism/prism.min[[+cache_buster_css]].css" rel="stylesheet">
`]]

[[++head_additional]]

[[- SET PLACEHOLDER WITH GLOBALLY EXCLUDED RESOURCES ]]
[[beforeEach?
    &input=`[[++nav_exclude_resources]]`
    &before=`-`
    &toPlaceholder=`excluded_resources`
]]

[[[[++romanesco.favicon_version:notempty=`$favicons`]]]]

[[[[If?
    &subject=`[[getContextSetting:default=`[[++google_analytics_ua]]`? &context=`[[*context_key]]` &setting=`google_analytics_ua`]]`
    &operator=`notempty`
    &then=`$googleAnalytics`
]]]]

[[++matomo_tracking_code]]

[[[[If?
    &subject=`[[++romanesco.private_backyard]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!checkPermissions? &context=`hub``
]]]]

[[$structuredDataSite]]
