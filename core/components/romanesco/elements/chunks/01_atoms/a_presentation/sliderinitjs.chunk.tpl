<script>
    var [[+var]] = new Swiper ('#[[+id]].swiper-container', {
        init: [[+init]],
        slidesPerView: [[+cols]],
        slidesPerGroup: [[+slides_to_scroll]],
        spaceBetween: [[+spacing]],
        watchOverflow: [[+overflow]],
        loop: [[+loop]],
        freeMode: [[+free]],
        centeredSlides: [[+center]],
        autoHeight: [[+auto_height]],
        autoplay: [[+autoplay]],
        keyboard: [[+keyboard]],
        effect: '[[+transition]]',
        navigation: {
            nextEl: '.[[+id]].swiper-button-next',
            prevEl: '.[[+id]].swiper-button-prev',
        },
        pagination: {
            el: '.[[+id]].swiper-pagination',
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