<div class="ui vertical stripe segment [[setBackground? &background=`[[*id]]`]]">
    <div class="ui container">
        <h1 class="ui header">[[*pagetitle]]</h1>

        [[$overviewOuter?
            &row_tpl=`overviewRowBasic`
            &cols=`four`
            &parent=`[[++romanesco.pattern_container_id]]`
            &title_field=`menutitle`
            &title_hierarchy=`h2`
            &depth=`0`
            &limit=`4`
            &show_hidden=`0`
            &sortby=`menuindex`
            &sortdir=`0`
            &pagination=`0`
            &show_subtitle=`1`
            &show_introtext=`0`
            &link_text=``
            &img_type=`landscape`
            &icon_type=`svg`
            &alignment=``
            &padding=`relaxed`
            &responsive=`stackable doubling`
            &de_emphasize=`0`
        ]]
    </div>
</div>
