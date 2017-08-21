[[+tab_type:is=`basic`:then=`pointing secondary`:else=`top attached`:toPlaceholder=`menu_type`]]
[[tabsGenerateNav?
    &input=`[[+rows]]`
    &prefix=`pl_[[+layout_idx]]_[[+unique_idx]]`
    &toPlaceholder=`tabs_menu`
]]

<div class="ui [[+tabs_total:textToNumber]] item [[+menu_type]] tabular menu">
    [[+[[+pl]].tabs_menu]]
</div>
[[+rows]]