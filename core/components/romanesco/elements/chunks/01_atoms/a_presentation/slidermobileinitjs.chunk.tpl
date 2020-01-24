<script>
    // Save original
    let container[[+var]] = $('#[[+id]].swiper-container-mobile');
    const original[[+var]] = container[[+var]].clone(true);

    // Prepare for Swiper usage
    container[[+var]].addClass('swiper-container');
    container[[+var]]
    .find('.nested.overview')
        .addClass('swiper-wrapper')
        .removeClass('stackable')
        .removeClass('doubling')
    ;
    container[[+var]]
    .find('.gallery')
        .addClass('swiper-wrapper')
        .removeClass('stackable')
        .removeClass('doubling')
    ;
    container[[+var]]
    .find('.swiper-wrapper-mobile')
        .addClass('swiper-wrapper')
    ;
    container[[+var]]
    .find('.swiper-wrapper > *')
        .addClass('swiper-slide')
    ;

    // Initialize Swiper
    let [[+var]] = new Swiper ('#[[+id]].swiper-container', {
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
        [[+effects]]
    });

    function addClasses() {

    }

    // media query event handler
    // if (matchMedia) {
    //     const mq = window.matchMedia("(max-width: 767.98px)");
    //     mq.addEventListener("change", widthChange);
    //     widthChange(mq);
    // }

    // media query change
    // function widthChange(mq) {
    //     if (mq.matches) {
    //         console.log('entering mobile');
    //
    //         [[+var]].init();
    //     } else {
    //         console.log('leaving mobile');
    //
    //         [[+var]].destroy();
    //     }
    // }

    MQ.addQuery(
        {
            context: 'mobile',
            match: function() {
                //addClasses();

                [[+var]].init();
            },
            unmatch: function() {
                [[+var]].destroy();

                $('#[[+id]].swiper-container-mobile').replaceWith(original[[+var]]);
            }
        }
    );
</script>