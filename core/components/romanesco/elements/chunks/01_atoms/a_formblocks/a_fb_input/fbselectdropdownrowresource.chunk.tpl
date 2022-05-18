[[!fbStripAsAlias:fbPrefixOutput:toPlaceholder=`field_alias`? &input=`[[+field_name_html:empty=`[[+field_name]]`]]`]]
<option value="[[+id]]"
        [[!+fb[[*id]].[[+field_alias]]:FormItIsSelected=`[[+id]]`]]
        [[!+fb[[*id]].[[+field_alias]]:contains=`[[+id]]`:then=`selected`]]
    >
    [[+pagetitle]]
</option>