[[+field_name:empty=`[[+field_name_html]]`:stripString=`?`:stripWords=`[[$fbStripWordsLabel]]`:toPlaceholder=`label`]]
[[+fb[[+id]]-[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias]]:nl2br:empty=``:toPlaceholder=`value`]]

[[+label:before=`<strong>`:after=`:</strong><br/>`]]
[[+value:replace=`,==<br/>`]][[+value:contains=`[[+option_other_value]]`:then=`, [[%formblocks.email.other_namely]] [[+fb[[+id]]-[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias]]-other]]`]]<br/><br/>