<script>
var [[+var]] = new Swiper ('#[[+id]].swiper-container', {
    slidesPerView: [[+cols]],
    slidesPerGroup: [[+slides_to_scroll]],
    loop: [[+loop]],
    effect: '[[+transition]]',
    spaceBetween: [[+spacing]],
    centeredSlides: [[+center]],
    freeMode: [[+free]],
    navigation: {
        nextEl: '#[[+id]] .swiper-button-next',
        prevEl: '#[[+id]] .swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        type: '[[+pagination]]',
        clickable: [[+clickable]],
    },
    [[+breakpoints]]
    [[+effects]]
})
</script>