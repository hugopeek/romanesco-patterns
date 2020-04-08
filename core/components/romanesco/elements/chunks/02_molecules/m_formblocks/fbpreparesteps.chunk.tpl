[[- Split previous steps into separate placeholders ]]
[[[[If?
    &subject=`[[+previous_steps]]`
    &operator=`notempty`
    &then=`splitString? &input=`[[+previous_steps]]` &delimiter=`,` &prefix=`prev_steps``
]]]]

[[- Find out which form is used in previous / next steps ]]
[[[[If?
    &subject=`[[+previous_steps]]`
    &operator=`notempty`
    &then=`pdoResources?
        &parents=`-1`
        &resources=`[[+previous_steps]]`
        &tpl=`fbGetFormID`
        &showHidden=`1`
        &limit=`0`
        &outputSeparator=`,`
        &toPlaceholder=`previous_forms`
    `
]]]]
[[[[If?
    &subject=`[[+next_step]]`
    &operator=`notempty`
    &then=`$fbGetFormID:toPlaceholder=`next_form`? &id=`[[+next_step]]``
]]]]

[[- Find out if current page is the last step ]]
[[cbGetFieldContent:toPlaceholder=`next_step_json`?
    &resource=`[[+next_step]]`
    &field=`22`
    &returnAsJSON=`1`
]]
[[modifiedIf:toPlaceholder=`is_last_step`?
    &subject=`,[[jsonGetValue? &input=`[[+next_step_json]]` &key=`previous_steps`]],`
    &operator=`contains`
    &operand=`,[[*id]],`
    &then=`0`
    &else=`1`
]]