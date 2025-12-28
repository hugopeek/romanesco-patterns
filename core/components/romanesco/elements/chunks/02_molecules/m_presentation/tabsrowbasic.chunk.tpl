[[Switch?
    &get=`[[+menu_position]]`
    &c1=`top` &do1=`bottom attached`
    &c2=`right` &do2=`[[+tab_type:is=`regular`:then=`seamless left attached`]]`
    &c3=`bottom` &do3=`top attached`
    &c4=`left` &do4=`[[+tab_type:is=`regular`:then=`seamless right attached`]]`
    &default=`bottom attached`
    &toPlaceholder=`menu_attachment_[[+unique_idx]]`
]]
[[+tab_type:contains=`basic`:then=`basic vertical`:else=`[[+menu_attachment_[[+unique_idx]]]]`:toPlaceholder=`tab_segment`]]
[[+tab_type:contains=`pointing regular`:or:contains=`pointing segments`:then=``:else=`[[+tab_segment]]`:toPlaceholder=`tab_segment`]]

<div class="item [[+idx:eq=`1`:then=`active`]] [[+tab_type:contains=`pointing segments`:then=`ui [[+segment_pointer]] segment`]]"
     data-tab="segment-[[+unique_idx]]-[[+idx]]"
     role="tab"
     aria-selected="false">
    <[[+level]] class="ui [[+level:is=`span`:then=`tiny`]] header">
        [[+heading]]
        [[If?
            &subject=`[[+subtitle]]`
            &operator=`notempty`
            &then=`<span class="sub header">[[+subtitle]]</span>`
        ]]
    </[[+level]]>
</div>

<div class="ui reducible [[+tab_segment]] [[+padding]] [[+idx:eq=`1`:then=`active`]] tab segment"
     data-tab="segment-[[+unique_idx]]-[[+idx]]"
     data-heading="[[+heading]]"
     data-level="[[+level:empty=`h4`]]"
     data-subtitle="[[+subtitle:empty=``]]"
     data-icon="[[+icon:empty=``]]"
     data-menu-position="[[+menu_position]]"
     role="tabpanel"
     aria-hidden="false">
    [[+content]]
</div>
