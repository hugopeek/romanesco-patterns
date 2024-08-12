[[$imageBasic?
    &id=`image-[[+uid]]`
    &classes=`[[+classes]] lightbox`
    &uid=`[[+uid]]`
]]

<div id="lightbox-[[+uid]]" class="ui basic fullscreen overlay modal">
    <i class="inside close icon"></i>
    <div class="ui center aligned middle aligned grid">
        <div class="column">
            <figure class="ui image">
                <img data-src="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++romanesco.img_quality]]&zc=1`]]"
                     class="lazy"
                     alt="[[+alt]]"
                >
                [[[[If?
                    &subject=`[[+credits]][[+caption]]`
                    &operator=`notempty`
                    &then=`$imageBasicCaption? &classes=`inverted` &uid=`[[+uid]]``
                ]]]]
            </figure>
        </div>
    </div>
</div>

[[loadAssets? &component=`lightbox`]]
[[loadAssets?
    &component=`custom`
    &inlineJS=`
    <script>
        window.addEventListener('DOMContentLoaded', function() {
            $('#image-[[+uid]] img').click(function () {
                $('#lightbox-[[+uid]]').modal('show');
            })
        });
    </script>
    `
]]