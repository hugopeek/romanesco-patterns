[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
<img [[+lazy]]src="[[+url]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[+width]] [[+height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     width="[[+width]]"
     height="[[+height]]"
     alt="[[+alt:empty=`[[+pagetitle]]`:htmlent]]"
/>