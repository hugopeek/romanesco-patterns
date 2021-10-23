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
[[modifiedIf?
    &subject=`[[++theme_font_page]][[++theme_font_header]]`
    &operator=`notempty`
    &then=`[[++theme_font_header]][[++theme_font_page:prepend=`[[++theme_font_header:notempty=`&family=`]]`]]`
    &toPlaceholder=`load_google_fonts`
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
<link rel="stylesheet" href="[[*critical_css_uri:replace=`.css==[[+cache_buster_css]].css`]]">
<link rel="stylesheet" href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css" media="print" onload="this.media='all'">
<link rel="stylesheet" href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css" media="print" onload="this.media='all'">
`:else=`
<link rel="stylesheet" href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css">
<link rel="stylesheet" href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css">
`]]

[[+load_google_fonts:notempty=`
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=[[+load_google_fonts:replace=` ==+`]]&display=swap" media="print" onload="this.media='all'">
`]]

[[- LOAD JS ASSETS WITH DEFER, SO DOWNLOADING WILL START EARLY WITHOUT BLOCKING RENDERING ]]
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_js_path]]/onmediaquery[[+minify]][[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_vendor_path]]/vanilla-lazyload/lazyload.min[[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_vendor_path]]/scrolldir/scrolldir.auto.min[[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_js_path]]/site[[+minify]][[+cache_buster_js]].js"></script>

[[- LOAD ADDITIONAL ASSETS, BASED ON CERTAIN CONDITIONS ]]
[[[[If?
    &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_map_id]]` &then=`1`]]`
    &operator=`notempty`
    &then=`loadAssets? &component=`map``
]]]]
[[[[If?
    &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_code_id]]` &then=`1`]][[*context_key:is=`hub`:or:is=`notes`:then=`1`]][[*uri:contains=`notes/`:then=`1`]][[*content_type:is=`11`:then=`1`]]`
    &operator=`notempty`
    &then=`loadAssets? &component=`syntax-highlighting``
]]]]
[[[[If?
    &subject=`[[*context_key]]`
    &operator=`is`
    &operand=`hub`
    &then=`loadAssets? &component=`hub``
]]]]

[[[[modifiedIf?
    &subject=`headAdditional`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$headAdditional`
]]]]
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
    &else=`++alternative_tracking_code`
]]]]

[[[[If?
    &subject=`[[++romanesco.private_backyard]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!checkPermissions? &context=`hub``
]]]]

[[$structuredDataSite]]
