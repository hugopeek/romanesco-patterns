<div id="markdown" class="ui vertical stripe segment [[setBackground? &background=`[[+background:empty=`[[++layout_background_default]]`]]`]]">
    <div class="ui [[+container_type]] [[+alignment]] container">
        [[$contentMarkdown]]
    </div>
</div>
[[[[$contentMarkdown:contains=`<table`:then=`loadAssets? &component=`table``]]]]