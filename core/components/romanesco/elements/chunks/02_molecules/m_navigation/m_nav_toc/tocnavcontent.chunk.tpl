[[+toc_type:contains=`dropdown`:then=`
<div id="dropdown-toc" class="[[+toc_type:contains=`list`:then=`mobile only`]]">
    [[$tocNavDropdown]]
</div>
`]]
[[+toc_type:contains=`list`:then=`
<div class="[[+toc_type:contains=`dropdown`:then=`mobile hidden`]]">
    [[+toc_title:lcase:isnot=`hidden`:then=`<div class="meta">[[+toc_title:empty=`[[%romanesco.toc.menu_title]]`]]</div>`]]
    <nav id="content-menu" class="ui [[+toc_size]] [[+toc_options_list:replace=`,== `]] vertical menu toc">
        [[- Menu items are generated by the TableOfContents plugin]]
    </nav>
</div>
`]]
[[!tableOfContents?
    &target=`[[+toc_type:eq=`dropdown`:then=`#dropdown-toc .menu`:else=`#content-menu`]]`
]]