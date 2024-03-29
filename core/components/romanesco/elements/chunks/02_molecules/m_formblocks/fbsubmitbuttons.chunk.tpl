[[pdoField?
    &id=`[[+prev_step]]`
    &field=`menutitle`
    &default=`pagetitle`
    &toPlaceholder=`prev_title`
]]
[[pdoField?
    &id=`[[+next_step]]`
    &field=`menutitle`
    &default=`pagetitle`
    &toPlaceholder=`next_title`
]]

<div class="ui very compact equal width middle aligned grid">
    [[+prev_step:isnot=``:then=`
    <div class="compact column">
        <a href="[[~[[+prev_step]]]]" class="ui tertiary icon back button" title="Go back to [[+prev_title]]">
            <i class="chevron left icon"></i>
            <span>[[+prev_title]]</span>
        </a>
    </div>
    `]]
    <div class="right aligned column">
        <input type="hidden" name="step-[[+current_id]]" value="completed">
        [[+last_step:isnot=`[[+current_id]]`:then=`
        <div class="ui [[+button_size:empty=`[[+form_size]]`]] input icon submission">
            <input class="[[+button_size:empty=`[[+form_size]]`]] [[+button_type]] [[+button_alignment]] ui button"
                   type="submit"
                   name="fb[[*id]]-submit"
                   value="[[+next_title]]"
                   title="Continue to [[+next_title]]">
            <i class="chevron right icon"></i>
        </div>
        `:else=`
        <input class="[[+button_size:empty=`[[+form_size]]`]] [[+button_type]] [[+button_alignment]] ui button"
               type="submit"
               name="fb[[*id]]-submit"
               value="[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]">
        `]]
    </div>
</div>