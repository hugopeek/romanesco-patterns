[[++romanesco.dev_mode:ne=`1`:then=`
<link rel="preconnect" href="https://ajax.googleapis.com">
`]]
[[+load_google_fonts:notempty=`
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
`]]
[[+load_critical_css:notempty=`
<link rel="preload" href="[[*critical_css_uri:replace=`.css==[[+cache_buster_css]].css`]]" as="style">
<link rel="preload" href="/[[++romanesco.semantic_css_path]]/backgrounds[[+minify]].css" as="style">
`]]
[[++logo_path:notempty=`
<link rel="preload" href="[[++logo_path]]" as="image" [[++logo_path:contains=`.svg`:then=`type="image/svg+xml"`]]>
`]]