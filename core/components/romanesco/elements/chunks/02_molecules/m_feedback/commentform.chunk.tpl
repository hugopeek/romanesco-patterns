<div id="comment-form-placeholder">
    <form id="comment-form" class="ui [[+form_size]] reply form" action="" method="post">
        <ol id="comment-preview-placeholder" class="ui threaded comments"></ol>
        <input type="hidden" name="thread" value="[[+thread]]"/>
        <input type="hidden" name="parent" value="0"/>
        <input type="hidden" name="id" value="0"/>

        <div class="field">
            <label for="comment-editor"></label>
            <textarea name="text" id="comment-editor" cols="30" rows="10"></textarea>
        </div>

        <div class="field">
            [[+comments_subscribe]]
        </div>

        <div class="field">
            <button type="submit" class="ui [[+form_size]] primary labeled icon submit button" title="Ctrl + Shift + Enter">
                <i class="icon edit"></i>
                [[%ticket_comment_save]]
            </button>
            <button type="button" class="ui [[+form_size]] preview button" title="Ctrl + Enter">
                [[%ticket_comment_preview]]
            </button>
            <span class="time"></span>
        </div>
    </form>
</div>