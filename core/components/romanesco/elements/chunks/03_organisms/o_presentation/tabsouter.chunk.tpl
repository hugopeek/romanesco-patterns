[[Switch:toPlaceholder=`menu_type_[[+unique_idx]]_[[+idx]]`?
    &get=`[[+tab_type]]`
    &c1=`regular` &do1=`[[+menu_position]] attached tabular`
    &c2=`basic` &do2=`pointing secondary tabular`
    &c3=`pointing basic` &do3=`pointing tabbed`
    &c4=`pointing regular` &do4=`pointing tabbed`
    &c5=`pointing segments` &do5=`tabbed secondary`
    &default=`top attached tabular`
]]
[[Switch:toPlaceholder=`segment_pointer`?
    &get=`[[+menu_position]]`
    &c1=`top` &do1=`down pointing`
    &c2=`right` &do2=`left pointing`
    &c3=`bottom` &do3=`up pointing`
    &c4=`left` &do4=`right pointing`
]]

[[tabsGenerateNav?
    &input=`[[+rows]]`
    &tpl=`tabsNav[[+menu_position:ucfirst:default=`Top`]]`
    &unique_idx=`[[+unique_idx]]_[[+layout_idx:empty=`[[+cta_id]]`]]`
]]

[[loadAssets? &component=`tabs`]]