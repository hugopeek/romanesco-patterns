[[[[*comments_toggle:eq=`1`:then=`$commentScript[[++comment_platform]]`]]]]
[[loadAssets?
    &component=`custom`
    &inlineJS=`<script defer src="[[++romanesco.semantic_js_path]]/site[[+minify:empty=``]][[+cache_buster_js:empty=``]].js"></script>`
]]
[[[[modifiedIf?
    &subject=`footerAdditional`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$footerAdditional`
]]]]
[[++footer_additional]]