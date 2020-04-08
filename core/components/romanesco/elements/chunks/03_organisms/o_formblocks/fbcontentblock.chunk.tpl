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
    &padding=`[[+padding]]`

    &button_type=`[[+button_type]]`
    &button_size=`[[+button_size]]`
    &button_alignment=`[[+button_alignment]]`

    &previous_steps=`[[+previous_steps:empty=``]]`
    &previous_forms=`[[+previous_forms:empty=``]]`
    &first_step=`[[+prev_steps.first:empty=``]]`
    &prev_step=`[[+prev_steps.last:empty=``]]`
    &next_step=`[[+next_step:empty=``]]`
    &next_form=`[[+next_form:empty=``]]`
    &is_last_step=`[[+is_last_step:empty=``]]`
]]