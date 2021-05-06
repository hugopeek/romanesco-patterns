[[+load_critical_css:notempty=`
<link href="[[*critical_css_uri:replace=`.css==[[+cache_buster_css]].css`]]" rel="preload" as="style">
`]]
[[splitString? &input=`[[++theme_font_page]]` &prefix=`font_page`]]
[[splitString? &input=`[[++theme_font_header]]` &prefix=`font_header`]]
[[+font_page.1:notempty=`
<link rel="preload" href="https://fonts.googleapis.com/css?family=[[+font_page.1]]:[[+font_page.2:empty=`300`]]&display=swap&subset=[[+font_page.3:empty=`latin`]]" as="style" crossorigin>
`]]
[[+font_header.1:notempty=`
<link rel="preload" href="https://fonts.googleapis.com/css?family=[[+font_header.1]]:[[+font_header.2:empty=`700`]]&display=swap&subset=[[+font_header.3:empty=`latin`]]" as="style" crossorigin>
`]]
<link rel="preload" href="/[[++romanesco.semantic_css_path]]/backgrounds[[+minify]].css" as="style">
<link rel="preload" href="/[[++romanesco.semantic_font_path]]/icons.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/[[++romanesco.semantic_font_path]]/outline-icons.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/[[++romanesco.semantic_font_path]]/brand-icons.woff2" as="font" type="font/woff2" crossorigin>
[[++logo_path:notempty=`
<link rel="preload" href="[[++logo_path]]" as="image" [[++logo_path:contains=`.svg`:then=`type="image/svg+xml"`]]>
`]]