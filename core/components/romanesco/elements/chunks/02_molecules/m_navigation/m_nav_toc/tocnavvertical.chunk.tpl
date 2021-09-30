<div id="dropdown-toc" class="ui vertical stripe segment mobile only tablet only">
    <div class="ui container">
        [[$tocNavDropdown? &size=`large`]]
    </div>
</div>

<nav id="submenu" class="ui [[+size]] secondary vertical fluid right pointing [[+sticky:eq=`1`:then=`sticky`]] toc menu tablet or lower hidden">
    [[!tableOfContents? &target=`#submenu`]]
</nav>