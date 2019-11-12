.background.[[+alias]]:before {
    background:
        [[+rows]] !important
    ;
    [[+opacity:notempty=`opacity: [[+opacity:div=`100`:replace=`,==.`]];`]]
    [[+filter:notempty=`filter: [[+filter]];`]]
    [[+filter:contains=`blur`:then=`transform: scale(1.1);`]]
}
.background.[[+alias]]:after {
    [[+background_color:notempty=`background: [[+background_color]] !important;`]]
}