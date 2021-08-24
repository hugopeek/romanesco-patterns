[[+load_google_fonts:notempty=`
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
`]]
[[+load_critical_css:notempty=`
<link href="[[*critical_css_uri:replace=`.css==[[+cache_buster_css]].css`]]" rel="preload" as="style">
`]]
<link rel="preload" href="/[[++romanesco.semantic_css_path]]/backgrounds[[+minify]].css" as="style">
[[++logo_path:notempty=`
<link rel="preload" href="[[++logo_path]]" as="image" [[++logo_path:contains=`.svg`:then=`type="image/svg+xml"`]]>
`]]