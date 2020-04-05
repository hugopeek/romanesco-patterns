[[[[If?
    &subject=`[[+previous_steps]][[+next_step]]`
    &operator=`notempty`
    &then=`$fbPrepareSteps`
]]]]

[[!$fbRenderFormWrapper?
    &form_id=`[[+form_id]]`
    &current_id=`[[*id]]`
    &current_pagetitle=`[[*pagetitle]]`
    &current_menutitle=`[[*menutitle]]`
    &form_size=`[[+form_size]]`
    &form_layout=`[[+form_layout]]`
    &segment_type=`[[+segment_type]]`
    &button_type=`[[+button_type]]`
    &padding=`[[+padding]]`

    &previous_steps=`[[+previous_steps]]`
    &first_step=`[[+prev_steps.first:empty=`[[*id]]`]]`
    &prev_step=`[[+prev_steps.last:empty=``]]`
    &next_step=`[[+next_step]]`
    &prev_step_form_id=`[[+prev_step_form_id]]`
    &next_step_form_id=`[[+next_step_form_id]]`
    &last_step=`[[+last_step]]`
]]