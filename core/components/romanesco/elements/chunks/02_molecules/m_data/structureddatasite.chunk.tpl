<script type="application/ld+json">
    {
        "@context" : "https://schema.org",
        "@graph" : [
            [[[[++client_type:eq=`organization`:then=`$organizationData`]]]]
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