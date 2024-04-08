[[[[modifiedIf?
    &subject=`organizationDataTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`organizationDataTheme`
    &else=`organizationData`
    &toPlaceholder=`organization_data`
]]]]
[[[[modifiedIf?
    &subject=`personDataTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`personDataTheme`
    &else=`personData`
    &toPlaceholder=`person_data`
]]]]
[[[[modifiedIf?
    &subject=`authorDataTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`authorDataTheme`
    &else=`authorData`
    &toPlaceholder=`author_data`
]]]]
<script type="application/ld+json">
    {
        "@context" : "https://schema.org",
        "@type": "[[*page_data_type:default=`WebPage`]]",
        "headline": "[[*longtitle:empty=`[[*pagetitle]]`]]",
        "@graph" : [
            [[[[++client_type:eq=`organization`:then=`$[[+organization_data]]`]]]]
            [[[[++client_type:eq=`person`:then=`$[[+person_data]]`]]]]
            [[[[+team_member_id:notempty=`$[[+author_data]]`]]]]
            [[[[cbHasFields? &field=`[[++romanesco.cb_field_faq_id]]` &then=`$faqDataWrapper`]]]]
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