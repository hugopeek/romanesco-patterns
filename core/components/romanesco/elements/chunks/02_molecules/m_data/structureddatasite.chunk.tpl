[[[[modifiedIf?
    &subject=`authorDataTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$authorDataTheme`
    &else=`$authorData`
    &toPlaceholder=`author_data`
]]]]
<script type="application/ld+json">
    {
        "@context" : "https://schema.org",
        "@graph" : [
            [[[[modifiedIf?
                &subject=`[[++client_type]]DataTheme`
                &operator=`iselement`
                &operand=`chunk`
                &then=`$[[++client_type]]DataTheme`
                &else=`$[[++client_type]]Data`
            ]]]]
            [[[[cbHasFields? &field=`[[++romanesco.cb_field_faq_id]]` &then=`$faqDataWrapper`]]]]
            [[+team_member_id:notempty=`[[+author_data]]`]]
            [[pdoCrumbs?
                &tpl=`breadcrumbDataRow`
                &tplCurrent=`breadcrumbDataCurrent`
                &tplWrapper=`breadcrumbDataWrapper`
                &outputSeparator=`,`
                &where=`[{"alias_visible:!=":"0"}]`
            ]]
            {
                "@type" : "WebPage",
                "name" : "[[*longtitle:empty=`[[*pagetitle]]`]]",
                "description" : "[[*description]]",
                "url" : "[[~[[*id]]? &scheme=`full`]]"
            }
        ]
    }
</script>