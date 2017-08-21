[[Switch:toPlaceholder=`menu_type_[[+idx]]`?
    &get=`[[+tab_type]]`
    &c1=`regular` &do1=`top attached tabular`
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

<div class="ui [[+justify_tabs:eq=`1`:then=`[[+tabs_total:textToNumber]] item`]] [[+menu_type_[[+idx]]]] menu">
    [[+[[+pl]].tabs_menu]]
</div>
[[+rows]]