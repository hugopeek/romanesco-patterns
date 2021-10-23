[[[[*comments_toggle:eq=`1`:then=`$commentScript[[++comment_platform]]`]]]]
[[modifiedIf?
    &subject=`[[++formblocks.antispam_hooks]]`
    &operator=`contains`
    &operand=`recaptchav3`
    &then=`<script async defer src="https://www.google.com/recaptcha/api.js?render=[[++recaptchav3.site_key]]&hl=[[++cultureKey]]"></script>`
]]
[[[[modifiedIf?
    &subject=`footerAdditional`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$footerAdditional`
]]]]
[[++footer_additional]]