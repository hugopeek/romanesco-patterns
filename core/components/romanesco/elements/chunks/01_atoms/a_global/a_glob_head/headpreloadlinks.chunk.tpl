[[++romanesco.dev_mode:ne=`1`:then=`
<link rel="preconnect" href="https://cdn.jsdelivr.net">
`]]
[[++analytics_tracking_code:contains=`googletagmanager.com`:then=`
<link rel="preconnect" href="https://googletagmanager.com">
`]]
[[+load_google_fonts:notempty=`
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
`]]
[[++logo_path:notempty=`
<link rel="preload" href="[[++logo_path]]" as="image" [[++logo_path:contains=`.svg`:then=`type="image/svg+xml"`]]>
`]]