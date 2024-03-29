<script>
    window.addEventListener('DOMContentLoaded', function() {
        // Prepare container for Swiper usage
        function create[[+var]](container) {
            container.addClass('swiper');
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

            return new Swiper ('#[[+id]].swiper', {
                init: [[+init]],
                slidesPerView: 1,
                slidesPerGroup: [[+slides_to_scroll]],
                spaceBetween: [[+spacing]],
                loop: [[+loop]],
                freeMode: {
                    enabled: [[+free]],
                    minimumVelocity: 0.2,
                    momentum: true,
                    sticky: true
                },
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
                [[+breakpoints]]
                [[+effects]]
            });
        }

        // Clone original container
        // Life saving SO question: https://stackoverflow.com/questions/921290/
        let mobile[[+var]] = document.querySelector('#[[+id]]').cloneNode( true );
        let desktop[[+var]] = document.querySelector('#[[+id]]').cloneNode( true );
            desktop[[+var]].setAttribute('id','[[+id]]-original');

        MQ.addQuery(
            {
                context: ['mobile'],
                match: function() {

                    // Make sure the original container is in place
                    $('#[[+id]]-original').replaceWith(mobile[[+var]]);

                    // Initialize Swiper
                    let [[+var]] = create[[+var]]($('#[[+id]].swiper-mobile'));

                    // Update lazy load with each new slide
                    [[+var]].on('slideChange', function () {
                        lazyLoadInstance.update();
                    });
                },
                unmatch: function() {

                    // Revert to default layout with cloned container
                    $('#[[+id]].swiper-mobile').replaceWith(desktop[[+var]]);
                }
            }
        );
    });
</script>