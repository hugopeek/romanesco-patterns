<div class="ui equal width grid">
    <div class="middle aligned row">
        <div class="column">
            <a href="[[~[[+prev_step]]]]" class="ui tertiary icon button" title="Go back to [[#[[+prev_step]].pagetitle]]">
                <i class="chevron left icon"></i>
                [[#[[+prev_step]].pagetitle]]
            </a>
        </div>
        <div class="column">
            <button class="ui [[+form_size]] [[+button_type]] right floated right labeled icon button"
                    type="submit"
                    name="submit-[[*alias]]"
                    title="Continue to [[#[[+next_step]].pagetitle]]"
            >
                <i class="chevron right icon"></i>
                [[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]] - [[+last_step]]
            </button>
        </div>
    </div>
</div>