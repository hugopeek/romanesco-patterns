<div id="map-[[+map_id:empty=`[[+unique_idx]]`]]" class="map"></div>

[[modifiedIf?
    &subject=`[[+marker_address:stripString=`,`:stripString=`.`]]`
    &operator=`numeric`
    &then=`[[+marker_address]]`
    &else=`[[-GeoCoderAddress? &address=`[[+marker_address]]`]]`
    &toPlaceholder=`marker_coordinates`
]]

<script>
    window.addEventListener('DOMContentLoaded', function() {
        const attribution = 'Map data &copy; <a href="http://openstreetmap.org">OSM</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>';

        const map = new L.Map('map-[[+map_id:empty=`[[+unique_idx]]`]]', {
            scrollWheelZoom: false
        });

        L.tileLayer('https://api.mapbox.com/styles/v1/{username}/{id}/tiles/{z}/{x}/{y}{r}?access_token={accessToken}', {
            attribution: attribution,
            tileSize: 512,
            zoomOffset: -1,
            maxZoom: [[+zoom_level_max:default=`18`]],
            id: '[[++romanesco.mapbox_style_id]]',
            username: '[[++romanesco.mapbox_username]]',
            accessToken: '[[++romanesco.mapbox_access_token]]'
        }).addTo(map);

        map.setView([ [[+marker_coordinates]] ], [[+zoom_level]]);

        L.marker([ [[+marker_coordinates]] ])
            .addTo(map)
            .bindPopup('[[+marker_popup:nl2br:stripForJS]]')
        ;

        // Only activate mousewheel scrolling on focus
        map.on('focus', function () {
            map.scrollWheelZoom.enable();
        });
        map.on('blur', function () {
            map.scrollWheelZoom.disable();
        });
    });
</script>

[[loadAssets? &component=`map`]]