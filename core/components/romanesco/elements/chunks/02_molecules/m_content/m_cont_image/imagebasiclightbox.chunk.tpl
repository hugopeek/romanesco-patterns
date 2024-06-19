[[$imageBasic?
    &id=`image-[[+uid]]`
    &classes=`rounded lightbox`
    &uid=`[[+uid]]`
]]

[[loadAssets? &component=`modal`]]
[[loadAssets?
    &component=`custom`
    &inlineJS=`
    <div id="lightbox-[[+uid]]" class="ui basic fullscreen overlay modal">
        <i class="inside close icon"></i>
        <figure class="ui image">
            <img data-src="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++romanesco.img_quality]]&zc=1`]]"
                 class="lazy"
                 alt="[[+alt]]"
            >
            [[[[If?
                &subject=`[[+credits]][[+caption]]`
                &operator=`notempty`
                &then=`$imageBasicCaption`
            ]]]]
        </figure>
    </div>
    <script>
        window.addEventListener('DOMContentLoaded', function() {
            $('#image-[[+uid]] img').click(function () {
                $('#lightbox-[[+uid]]').modal('show');
            })
        });
    </script>
    `
]]