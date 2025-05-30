<title>[[+title_format:default=`[[++romanesco.title_format]]`]]</title>

<meta charset="[[++modx_charset]]">
<meta name="description" content="[[*description]]">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

[[$openGraphMeta]]

<base href="[[!++site_url]]">

<script>document.documentElement.className = 'js';</script>

[[- SET PLACEHOLDERS FOR CONDITIONAL STATEMENTS FURTHER DOWN ]]
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
[[beforeEach?
    &input=`[[++nav_exclude_resources]]`
    &before=`-`
    &toPlaceholder=`excluded_resources`
]]

[[- PRELOAD ASSETS WITH HIGHEST PRIORITY ]]
[[[[modifiedIf?
    &subject=`headPreloadLinksTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$headPreloadLinksTheme`
    &else=`$headPreloadLinks`
]]]]

[[- LOAD CSS ASSETS, ASYNCHRONOUS IF CRITICAL CSS IS ENABLED ]]
[[+load_critical_css:eq=`1`:then=`
<style>[[*critical_css_uri:getFileContent]]</style>
<link rel="stylesheet" href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css" media="print" onload="this.media='all'">
<link rel="stylesheet" href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css" media="print" onload="this.media='all'">
`:else=`
<link rel="stylesheet" href="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_css]].css">
<link rel="stylesheet" href="[[++romanesco.custom_css_path]]/site[[+minify]][[+cache_buster_css]].css">
`]]

[[modifiedIf?
    &subject=`[[helloConsentFriend? &service=`googleFonts` &true=`` &false=`[[+load_google_fonts]]`]]`
    &operator=`notempty`
    &then=`<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=[[+load_google_fonts:replace=` ==+`]]&display=swap" media="print" onload="this.media='all'">`
]]

[[- LOAD JS ASSETS WITH DEFER, SO DOWNLOADING WILL START EARLY WITHOUT BLOCKING RENDERING ]]
[[++romanesco.dev_mode:ne=`1`:then=`
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
`:else=`
<script defer src="[[++romanesco.semantic_vendor_path]]/jquery/jquery.min[[+cache_buster_js:notempty=`.361`]].js"></script>
`]]
<script defer src="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_js_path]]/onmediaquery[[+minify]][[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_vendor_path]]/vanilla-lazyload/lazyload.min[[+cache_buster_js]].js"></script>
<script defer src="[[++romanesco.semantic_vendor_path]]/scrolldir/scrolldir.auto.min[[+cache_buster_js]].js"></script>

[[- CONDITIONALLY LOAD ASSETS FOR SPECIFIC COMPONENTS ]]
[[[[If?
    &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_map_id]]` &then=`1`]]`
    &operator=`notempty`
    &then=`loadAssets? &component=`map``
]]]]
[[[[If?
    &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_code_id]]` &then=`1`]][[*context_key:is=`hub`:or:is=`notes`:then=`1`]][[*uri:contains=`notes/`:then=`1`]][[*content_type:is=`11`:then=`1`]]`
    &operator=`notempty`
    &then=`loadAssets? &component=`code``
]]]]
[[[[If?
    &subject=`[[*context_key]]`
    &operator=`is`
    &operand=`hub`
    &then=`loadAssets? &component=`hub``
]]]]

[[- PLACE ADDITIONAL HEAD ELEMENTS ]]
[[[[modifiedIf?
    &subject=`headAdditional`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$headAdditional`
]]]]
[[++head_additional]]

[[- PLACE REFERENCES TO FAVICONS ]]
[[[[++romanesco.favicon_version:notempty=`$favicons`]]]]

[[- PLACE ANALYTICS CODE SNIPPET, UNLESS CONSENTFRIEND IS ACTIVE ]]
[[[[helloConsentFriend?
    &true=``
    &false=`++analytics_tracking_code`
]]]]

[[- PLACE SCHEMA.ORG STRUCTURED DATA ]]
[[[[If?
    &subject=`[[++romanesco.structured_data]]`
    &operator=`eq`
    &operand=`1`
    &then=`$structuredDataSite`
]]]]

[[- DENY ACCESS TO HUB CONTEXT, IF MARKED AS PRIVATE ]]
[[[[If?
    &subject=`[[++romanesco.private_backyard]]`
    &operator=`eq`
    &operand=`1`
    &then=`!checkPermissions? &context=`hub``
]]]]

[[- SET HIGHEST ACCESS LEVEL FOR LOGGED-IN USER ]]
[[!setUserAccessLevel? &toPlaceholder=`user_access_level`]]