[[!fbStripAsAlias:fbPrefixOutput:toPlaceholder=`field_alias`? &input=`[[+field_name]]`]]
[[!fbStripNonAlpha:toPlaceholder=`value_[[+idx]]`? &input=`[[+name]]`]]

<option value="[[+value_[[+idx]]]]"
        [[!+fb[[*id]].[[+field_alias]]:FormItIsSelected=`[[+value_[[+idx]]]]`]]
        [[!+fb[[*id]].[[+field_alias]]:contains=`[[+value_[[+idx]]]]`:then=`selected`]]
    >
    [[+value_[[+idx]]]]
</option>