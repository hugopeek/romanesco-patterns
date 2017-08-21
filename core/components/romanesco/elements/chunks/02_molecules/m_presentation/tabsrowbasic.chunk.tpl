[[Switch:toPlaceholder=`menu_attachment_[[+unique_idx]]`?
    &get=`[[+menu_position]]`
    &c1=`top` &do1=`bottom attached`
    &c2=`right` &do2=``
    &c3=`bottom` &do3=`top attached`
    &c4=`left` &do4=``
]]

[[+tab_type:contains=`basic`:then=`basic vertical`:else=`[[+menu_attachment_[[+unique_idx]]]]`:toPlaceholder=`tab_segment`]]
[[+tab_type:contains=`pointing regular`:or:contains=`pointing segments`:then=``:else=`[[+tab_segment]]`:toPlaceholder=`tab_segment`]]

<div class="ui [[+tab_segment]] [[+padding]] [[+idx:eq=`1`:then=`active`]] tab segment"
     data-tab="segment-[[+unique_idx]]-[[+idx]]"
     data-heading="[[+heading]]"
     data-heading-level="[[+heading_level]]"
     data-heading-subtitle="[[+heading_subtitle:empty=``]]"
     data-heading-icon="[[+heading_icon:empty=``]]"
     role="tabpanel"
     aria-hidden="false">
    [[+content]]
</div>