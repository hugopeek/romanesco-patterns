[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput=`fb[[+id]]-`:toPlaceholder=`name`]]

<input id="[[+name]]" type="hidden" name="[[+name]]" value="[[!+[[+name]]]]">
[[+[[+name]]-other:notempty=`<input id="[[+name]]-other" type="hidden" name="[[+name]]-other" value="[[!+[[+name]]-other]]">`]]
