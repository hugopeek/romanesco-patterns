[[+tab_type:is=`basic`:then=`basic vertical`:else=`bottom attached`:toPlaceholder=`tab_segment`]]

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