[[- Split previous steps into separate placeholders ]]
[[[[If?
    &subject=`[[+previous_steps]]`
    &operator=`notempty`
    &then=`splitString? &input=`[[+previous_steps]]` &delimiter=`,` &prefix=`prev_steps``
]]]]

[[- Find out which form is used in previous / next steps ]]
[[[[If?
    &subject=`[[+prev_steps.last]]`
    &operator=`notempty`
    &then=`
        cbGetFieldContent:toPlaceholder=`prev_step_form_id`?
            &resource=`[[+prev_steps.last]]`
            &field=`22`
            &tpl=`fbFormID`
        `
]]]]
[[[[If?
    &subject=`[[+next_step]]`
    &operator=`notempty`
    &then=`
        cbGetFieldContent:toPlaceholder=`next_step_form_id`?
            &resource=`[[+next_step]]`
            &field=`22`
            &tpl=`fbFormID`
        `
]]]]

[[- Find out if current page is the last step ]]
[[cbGetFieldContent:toPlaceholder=`next_step_json`?
    &resource=`[[+next_step]]`
    &field=`22`
    &returnAsJSON=`1`
]]
[[modifiedIf:toPlaceholder=`last_step`?
    &subject=`,[[jsonGetValue? &input=`[[+next_step_json]]` &key=`previous_steps`]],`
    &operator=`contains`
    &operand=`,[[*id]],`
    &then=`0`
    &else=`1`
]]