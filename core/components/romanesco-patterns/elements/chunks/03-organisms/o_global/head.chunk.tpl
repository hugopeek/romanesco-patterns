<head>
    <meta charset="[[++modx_charset]]">
    <title>[[*longtitle:empty=`[[*pagetitle]]`]] - [[++site_name]]</title>
    <meta name="description" content="[[*description]]">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="[[!++site_url]]">

    <link href="[[!++patternlab.semantic_dist_path]]/semantic[[++minify_css_js:eq=`1`:then=`.min`]].css" rel="stylesheet">
    <link rel="stylesheet" href="[[getContextSetting? &context=`web` &setting=`site_url`]]assets/css/backgrounds.css">

    [[cbHasField?
        &field=`[[++patternlab.cb_field_code_id]]`
        &then=`<link rel="stylesheet" href="[[++patternlab.custom_vendor_path]]/prism/prism.css">`
    ]]

    [[++head_additional]]
    [[$favicons]]

    [[If?
        &subject=`[[++patternlab.dev_mode]]`
        &operator=`EQ`
        &operand=`1`
        &then=``
        &else=`[[$googleAnalytics]]`
    ]]

    [[$structuredDataSite]]
</head>