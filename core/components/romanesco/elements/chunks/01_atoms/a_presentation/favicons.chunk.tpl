[[If?
    &subject=`[[++logo_badge_path]]`
    &operator=`endswith`
    &operand=`.svg`
    &then=`<link rel="icon" type="image/svg+xml" href="[[++romanesco.favicon_path]]/icon[[+cache_buster_favicon]].svg" />`
    &else=`<link rel="icon" type="image/png" href="[[++romanesco.favicon_path]]/icon-96x96[[+cache_buster_favicon]].png" sizes="96x96" />`
]]
<link rel="icon" href="favicon[[+cache_buster_favicon]].ico" sizes="32x32"/>
<link rel="apple-touch-icon" href="[[++romanesco.favicon_path]]/apple-touch-icon[[+cache_buster_favicon]].png" sizes="180x180"/>
<meta name="apple-mobile-web-app-title" content="[[++favicon_app_title:empty=`[[++site_name]]`]]" />
<link rel="manifest" href="site.webmanifest" />
