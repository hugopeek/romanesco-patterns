[[[[If?
    &subject=`[[+multiple_steps]]`
    &operator=`notempty`
    &then=`$fbPrepareSteps`
]]]]

[[[[++formblocks.ajax_mode:eq=`1`:then=``:else=`!`]]$fbRenderFormWrapper?
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

    &multiple_steps=`[[+multiple_steps:empty=``]]`
    &prev_steps=`[[+section.1:empty=``]]`
    &next_steps=`[[+section.2:empty=``]]`
    &prev_forms=`[[+prev_forms:empty=``]]`
    &next_forms=`[[+next_forms:empty=``]]`
    &prev_step=`[[+prev_steps.last:empty=``]]`
    &next_step=`[[+next_steps.first:empty=``]]`
    &first_step=`[[+step.first:empty=``]]`
    &last_step=`[[+step.last:empty=``]]`
    &redirect_id=`[[+redirect_id:empty=``]]`
]]