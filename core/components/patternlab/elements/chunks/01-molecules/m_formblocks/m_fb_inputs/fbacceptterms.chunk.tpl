<div id="fb[[*id]]-accept-terms" class="required inline field [[!If? &subject=`[[+fb[[*id]].error.fb[[*id]]-accept-terms]]` &operator=`notempty` &then=`error`]]">
    <div class="ui checkbox">
        <input type="checkbox"
               name="fb[[*id]]-accept-terms[]"
               id="fb[[*id]]-accept-terms-1"
               value="1"
               tabindex="0"
               class="hidden"
               [[!+fb[[*id]].fb[[*id]]-accept-terms:FormItIsChecked=`1`]]>
        <label>[[+field_text:replace=`[[+link]]==<a href="[[~[[+link_id]]]]">[[+link_text]]</a>`]]</label>
    </div>
</div>