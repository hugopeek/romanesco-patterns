<head>
    <title>[[*longtitle:empty=`[[*pagetitle]]`]] - [[++site_name]]</title>

    <meta charset="[[++modx_charset]]">
    <meta name="description" content="[[*description]]">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    [[$openGraphMeta]]

    <base href="[[!++site_url]]">

    <script>document.documentElement.className = 'js';</script>

    <link href="[[!++romanesco.semantic_dist_path]]/semantic[[++minify_css_js:eq=`1`:then=`.min`]].css" rel="stylesheet">
    <link href="[[getContextSetting? &context=`web` &setting=`site_url`]]assets/css/backgrounds.css" rel="stylesheet">
    
    [[~[[*id]]:contains=`status`:or:contains=`hub`:then=`1`:toPlaceholder=`load_assets_hub`]]
    [[+load_assets_hub:eq=`1`:then=`<link href="[[!++romanesco.semantic_dist_path]]/components/modal.css" rel="stylesheet">`]]

    [[cbHasFields?
        &field=`[[++romanesco.cb_field_code_id]]`
        &then=`<link href="[[++romanesco.custom_vendor_path]]/prism/prism.min.css" rel="stylesheet">`
    ]]
    [[cbHasFields?
        &field=`[[++romanesco.cb_field_map_id]]`
        &then=`
            <link href="https://unpkg.com/leaflet@1.1.0/dist/leaflet.css" integrity="sha512-wcw6ts8Anuw10Mzh9Ytw4pylW8+NAD4ch3lqm9lzAsTxg0GFeJgoAtxuCLREZSC5lUXdVyo/7yfsqFjQ4S+aKw==" crossorigin="" rel="stylesheet"/>
            <script src="https://unpkg.com/leaflet@1.1.0/dist/leaflet.js" integrity="sha512-mNqn2Wg7tSToJhvHcqfzLMU6J4mkOImSPTxVZAdo+lcPlk+GhZmYgACEe0x35K7YzW1zJ7XyJV/TT1MrdXvMcA==" crossorigin=""></script>
        `
    ]]

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