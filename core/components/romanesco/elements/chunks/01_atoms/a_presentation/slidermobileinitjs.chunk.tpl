<script>
    function swiperPrepare(container) {
        // Prepare for Swiper usage
        container.addClass('swiper-container');
        container
            .find('.nested.overview')
            .addClass('swiper-wrapper')
            .removeClass('stackable')
            .removeClass('doubling')
        ;
        container
            .find('.gallery')
            .addClass('swiper-wrapper')
            .removeClass('stackable')
            .removeClass('doubling')
        ;
        container
            .find('.swiper-wrapper-mobile')
            .addClass('swiper-wrapper')
        ;
        container
            .find('.swiper-wrapper > *')
            .addClass('swiper-slide')
        ;
    }

    // Save original container
    //let original[[+var]] = $('#[[+id]].swiper-container-mobile').clone(true);

    // Clone original container
    let container[[+var]] = $('#[[+id]].swiper-container-mobile').clone(true);

    //container[[+var]].appendTo('#[[+id]]');

    // Prepare clone
    swiperPrepare(container[[+var]])

    //console.log(container[[+var]]);

    // Apply Swiper to clone
    let [[+var]] = new Swiper ('#[[+id]].swiper-container', {
        init: 'true',
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

    var my[[+var]] = document.querySelector('#[[+id]].swiper-container').swiper;

    console.log(my[[+var]]);

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
                

                //[[+var]].init();
                $('#[[+id]].swiper-container-mobile').replaceWith('<div id="hoi">hoi</div>');

                $('#doei').replaceWith('<div id="hoi">hoi</div>');
            },
            unmatch: function() {
                // [[+var]].on('beforeDestroy', function() {
                //     console.log('about to destroy');
                //     $('#[[+id]].swiper-container-mobile').replaceWith('hoi');
                // });

                //console.log(original[[+var]]);

                $('#hoi').replaceWith('<div id="doei">doei</div>');

                //[[+var]].destroy();
            }
        }
    );
</script>