<head>
    <title>[[++romanesco.title_format]]</title>

    <meta charset="[[++modx_charset]]">
    <meta name="description" content="[[*description]]">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    [[$openGraphMeta]]

    <base href="[[!++site_url]]">

    <script>document.documentElement.className = 'js';</script>

    [[If?
        &subject=`[[++generate_critical_css]]`
        &operator=`eq`
        &operand=`1`
        &then=`
        <link href="[[++romanesco.custom_css_path]]/critical/[[+template_uri:empty=`[[*uri:filterPathSegment]]`]].css" rel="stylesheet">
        <link href="[[++romanesco.semantic_dist_path]]/semantic[[++minify_css_js:eq=`1`:then=`.min`]].css?v=[[++romanesco.assets_version_css]]" rel="stylesheet" media="print" onload="this.media='all'">
        <link href="[[++romanesco.custom_css_path]]/site[[++minify_css_js:eq=`1`:then=`.min`]].css?v=[[++romanesco.assets_version_css]]" rel="stylesheet" media="print" onload="this.media='all'">
        `
        &else=`
        <link href="[[++romanesco.semantic_dist_path]]/semantic[[++minify_css_js:eq=`1`:then=`.min`]].css?v=[[++romanesco.assets_version_css]]" rel="stylesheet">
        <link href="[[++romanesco.custom_css_path]]/site[[++minify_css_js:eq=`1`:then=`.min`]].css?v=[[++romanesco.assets_version_css]]" rel="stylesheet">
        `
    ]]

    [[- SET CONDITIONS FOR LOADING ADDITIONAL ASSETS ]]
    [[~[[*id]]:contains=`status`:or:contains=`hub`:then=`1`:toPlaceholder=`load_assets_hub`]]
    [[cbHasFields:toPlaceholder=`load_assets_map`? &field=`[[++romanesco.cb_field_map_id]]` &then=`1`]]
    [[modifiedIf?
        &subject=`[[cbHasFields? &field=`[[++romanesco.cb_field_code_id]]` &then=`1`]][[*context_key:is=`notes`:then=`1`]]`
        &operator=`notempty`
        &then=`1`
        &toPlaceholder=`load_syntax_highlighting`
    ]]

    [[+load_assets_map:eq=`1`:then=`<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>`]]
    [[+load_assets_hub:eq=`1`:then=`<link href="[[++romanesco.semantic_dist_path]]/components/modal.css" rel="stylesheet">`]]
    [[+load_syntax_highlighting:eq=`1`:then=`<link href="[[++romanesco.semantic_vendor_path]]/prism/prism.min.css" rel="stylesheet">`]]

    [[++head_additional]]

    [[[[++romanesco.favicon_version:notempty=`$favicons`]]]]

    [[[[If?
        &subject=`[[getContextSetting:default=`[[++google_analytics_ua]]`? &context=`[[*context_key]]` &setting=`google_analytics_ua`]]`
        &operator=`notempty`
        &then=`$googleAnalytics`
    ]]]]
    [[[[If?
        &subject=`[[getContextSetting:default=`[[++matomo_analytics_url]]`? &context=`[[*context_key]]` &setting=`matomo_analytics_url`]]`
        &operator=`notempty`
        &then=`$matomoAnalytics`
    ]]]]

    [[[[If?
        &subject=`[[++romanesco.private_backyard]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!checkPermissions? &context=`hub``
    ]]]]

    [[$structuredDataSite]]
</head>