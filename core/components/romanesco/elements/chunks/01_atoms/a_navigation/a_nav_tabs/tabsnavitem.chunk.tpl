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