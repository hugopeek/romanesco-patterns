[[-<img src="[[+url]]" alt="[[+alt]]">]]

<img srcset="[[+source.src:pthumb=`[[+crop.options]]&w=1920`]] 1920w,
        [[+source.src:pthumb=`[[+crop.options]]&w=1600`]] 1600w,
        [[+source.src:pthumb=`[[+crop.options]]&w=1300`]] 1300w,
        [[+source.src:pthumb=`[[+crop.options]]&w=992`]] 992w,
        [[+source.src:pthumb=`[[+crop.options]]&w=768`]] 768w,
        [[+source.src:pthumb=`[[+crop.options]]&w=360`]] 360w"
     sizes="(min-width: 1300px) calc(100vw / [[+cols]]),
        (min-width: 992px) calc(100vw / [[+cols]]),
        (min-width: 768px) [[+cols:gt=`1`:then=`calc((768px - 2em) / 2)`:else=`768px`]],
        (min-width: 360px) 100vw,
        100vw"
     src="[[+url]]"
     alt="[[+alt]]"
/>