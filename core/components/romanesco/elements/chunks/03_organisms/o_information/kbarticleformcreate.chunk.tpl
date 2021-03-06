<form class="ui [[+form_size]] create form" method="post" action="" id="ticketForm">
    <div id="ticket-preview-placeholder"></div>

    <input type="hidden" name="tid" value="0"/>

    <div class="field">
        <label for="ticket-sections">Section</label>
        <select name="parent" class="ui dropdown" id="ticket-sections">
            [[+sections]]
        </select>
        <span class="error"></span>
    </div>

    <div class="field">
        <label for="ticket-pagetitle">[[%ticket_pagetitle]]</label>
        <input type="text" placeholder="Be specific" name="pagetitle" value="" maxlength="50" id="ticket-pagetitle"/>
        <span class="error"></span>
    </div>

    <div class="field">
        <label for="ticket-editor">[[%ticket_content]]</label>
        <textarea name="content" id="ticket-editor" rows="10" placeholder="### Your content

*You can use markdown formatting here.*

- Close your eyes
- Think about what you want to say
- Open your eyes again
- Write it down

Thank you!"></textarea>
        <span class="error"></span>
    </div>

    <div class="ticket-form-files">
        [[+files]]
    </div>

    <div class="form-actions">
        <input type="button" class="ui [[+form_size]] preview button" value="[[%ticket_preview]]" title="Ctrl + Enter"/>
        <div class="ui primary buttons">
            <input type="button" class="ui [[+form_size]] primary publish button" name="publish" value="[[%ticket_publish]]" title=""/>
            <div class="ui floating dropdown icon button">
                <i class="dropdown icon"></i>
                <div class="menu">
                    <input type="submit" class="item" name="draft" value="Save as draft" title="Ctrl + Shift + Enter"/>
                </div>
            </div>
        </div>
    </div>
</form>