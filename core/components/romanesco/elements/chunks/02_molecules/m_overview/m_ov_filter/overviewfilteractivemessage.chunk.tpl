[[!TaggerGetCurrentTag:notempty=`
<div id="filter-active" class="ui basic secondary-color segment">
    <div class="ui compact middle aligned equal width grid">
        <div class="compact column mobile hidden tablet hidden">
            <i class="disabled secondary filter icon"></i>
        </div>
        <div class="column">
            <div class="ui large secondary labels">
                <span class="meta">[[%romanesco.filter.active]]</span>
                [[!TaggerGetCurrentTag?
                    &tagTpl=`tagItemBasic`
                    &groupTpl=`@INLINE <span class="meta">[[+alias]]:</span> [[+tags]]`
                    &outTpl=`@INLINE [[+groups]]`
                    &tagSeparator=``
                    &groupSeparator=`<span class="meta">[[%romanesco.filter.and]]</span> `
                ]]
            </div>
        </div>
        <div class="compact column">
            <a href="[[~[[*id]]]]">
                <span class="ui secondary text">[[%romanesco.filter.reset]]</span>
                <i class="secondary undo alternate icon"></i>
            </a>
        </div>
    </div>
</div>
`]]