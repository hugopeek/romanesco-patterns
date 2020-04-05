<div class="ui equal width middle aligned grid">
    [[+prev_step:isnot=``:then=`
    <div class="column">
        <a href="[[~[[+prev_step]]]]" class="ui tertiary icon button" title="Go back to [[#[[+prev_step]].pagetitle]]">
            <i class="chevron left icon"></i>
            [[#[[+prev_step]].pagetitle]]
        </a>
    </div>
    `]]
    <div class="right aligned column">
        [[+last_step:isnot=`1`:then=`
        <div class="ui icon input">
            <input class="ui [[+form_size]] [[+button_type]] button"
                   type="submit"
                   name="submit-[[*alias]]"
                   value="[[#[[+next_step]].pagetitle]]"
                   title="Continue to [[#[[+next_step]].pagetitle]]">
            <i class="chevron right icon"></i>
        </div>
        `:else=`
        <input class="ui [[+form_size]] [[+button_type]] button"
               type="submit"
               name="submit-[[*alias]]"
               value="[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]">
        `]]
    </div>
</div>