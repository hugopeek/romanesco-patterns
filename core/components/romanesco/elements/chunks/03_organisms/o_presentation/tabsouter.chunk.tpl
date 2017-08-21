[[Switch:toPlaceholder=`menu_type_[[+idx]]`?
    &get=`[[+tab_type]]`
    &c1=`regular` &do1=`[[+menu_position]] attached tabular`
    &c2=`basic` &do2=`pointing secondary tabular`
    &c3=`pointing basic` &do3=`pointing tabbed`
    &c4=`pointing regular` &do4=`pointing tabbed`
    &c5=`pointing segments` &do5=`tabbed secondary`
]]

[[tabsGenerateNav?
    &input=`[[+rows]]`
    &prefix=`pl_[[+layout_idx]]_[[+unique_idx]]`
    &toPlaceholder=`tabs_menu`
]]

[[[[Switch?
    &get=`[[+menu_position]]`
    &c1=`top` &do1=`$tabsNavTop`
    &c2=`right` &do2=`$tabsNavRight`
    &c3=`bottom` &do3=`$tabsNavBottom`
    &c4=`left` &do4=`$tabsNavLeft`
]]]]