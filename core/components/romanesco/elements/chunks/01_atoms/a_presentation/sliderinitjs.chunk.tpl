<script>
var [[+var]] = new Swiper ('#[[+id]].swiper-container', {
    init: [[+init]],
    slidesPerView: [[+cols]],
    slidesPerGroup: [[+slides_to_scroll]],
    spaceBetween: [[+spacing]],
    loop: [[+loop]],
    freeMode: [[+free]],
    centeredSlides: [[+center]],
    autoHeight: [[+auto_height]],
    autoplay: [[+autoplay]],
    effect: '[[+transition]]',
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
});
[[+init_lightbox]]

// Update lazy load with each new slide
[[+var]].on('slideChange', function () {
    lazyLoadInstance.update();
});
</script>