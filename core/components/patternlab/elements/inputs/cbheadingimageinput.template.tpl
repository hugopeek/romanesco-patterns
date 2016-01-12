<div class="contentblocks-field contentblocks-field-heading contentblocks-field-image contentblocks-drop-target">
    <div class="contentblocks-field-actions"></div>

    <label for="{%=o.generated_id%}_input">{%=o.name%}</label>
    <div class="contentblocks-field-select contentblocks-field-heading-level">
        <select></select>
    </div>
    <div class="contentblocks-field-input contentblocks-field-heading-input">
        <input type="text" value="{%=o.value%}" id="{%=o.generated_id%}_input">
    </div>
</div>

<div class="contentblocks-exposed-fields-wrapper">
    <input type="hidden" class="url" />
    <input type="hidden" class="size" />
    <input type="hidden" class="extension" />
    <div class="contentblocks-field-actions">
        <a href="javascript:void(0);" class="contentblocks-field-delete-image">&times; {%=_('contentblocks.delete_image')%}</a>
    </div>

    <div class="contentblocks-field-image-upload">
        <a href="javascript:void(0);" class="big contentblocks-field-button contentblocks-field-image-choose">{%=_('contentblocks.choose')%}</a>
        <a href="javascript:void(0);" class="big contentblocks-field-button contentblocks-field-upload">{%=_('contentblocks.upload')%}</a>
        {%=_('contentblocks.image.or_drop_image')%}
        <input type="file" id="{%=o.generated_id%}-upload" class="contentblocks-field-upload-field">
    </div>
    <div class="contentblocks-field-image-uploading">
        <div class="upload-progress">
            <div class="bar"></div>
        </div>
    </div>
    <div class="contentblocks-field-image-preview">
        <img />
    </div>
</div>