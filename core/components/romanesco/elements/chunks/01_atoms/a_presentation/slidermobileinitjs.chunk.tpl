<script>
    // Prepare container for Swiper usage
    function create[[+var]](container) {
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
                nextEl: '.[[+id]].swiper-button-next',
                prevEl: '.[[+id]].swiper-button-prev',
            },
            pagination: {
                el: '.[[+id]].swiper-pagination',
                type: '[[+pagination]]',
                clickable: [[+clickable]],
            },
            [[+effects]]
        });
    }

    // Clone original container
    // Life saving SO question: https://stackoverflow.com/questions/921290/
    let original[[+var]] = document.querySelector('#[[+id]]').cloneNode( true );
    let cloned[[+var]] = document.querySelector('#[[+id]]').cloneNode( true );
        cloned[[+var]].setAttribute( 'id', '[[+id]]-clone' );


    MQ.addQuery(
        {
            context: 'mobile',
            match: function() {

                // Make sure the original container is in place
                $('#[[+id]]-clone').replaceWith(original[[+var]]);
                
                // Initialize Swiper
                create[[+var]]($('#[[+id]].swiper-container-mobile'));

                // Update lazy load with each new slide
                [[+var]].on('slideChange', function () {
                    lazyLoadInstance.update();
                });
            },
            unmatch: function() {

                // Revert to default layout with cloned container
                $('#[[+id]].swiper-container-mobile').replaceWith(cloned[[+var]]);
            }
        }
    );
</script>