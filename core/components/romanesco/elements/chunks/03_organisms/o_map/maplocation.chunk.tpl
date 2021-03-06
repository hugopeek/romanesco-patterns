<div id="map-[[+map_id:empty=`[[+unique_idx]]`]]" class="map"></div>

[[modifiedIf?
    &subject=`[[+marker_address:stripString=`,`:stripString=`.`]]`
    &operator=`numeric`
    &then=`[[+marker_address]]`
    &else=`[[GeoCoderAddress? &address=`[[+marker_address]]`]]`
    &toPlaceholder=`marker_coordinates`
]]

<script>
    var map = L.map('map-[[+map_id:empty=`[[+unique_idx]]`]]').setView([ [[+marker_coordinates]] ], [[+map_zoom_level]]);
    var mapTiles = 'https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}[[++img_hidpi:eq=`1`:then=`@2x`]]?access_token=[[++mapbox_access_token:empty=`[[++romanesco.mapbox_access_token]]`]]';

//    var icon = L.icon({
//        iconUrl: '[[+logo_badge_path]]',
//
//        iconSize:     [32, 32], // size of the icon
//        iconAnchor:   [16, 16], // point of the icon which will correspond to marker's location
//        popupAnchor:  [0, -12] // point from which the popup should open relative to the iconAnchor
//    });

    L.tileLayer(mapTiles, {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OSM</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18
    }).addTo(map);

    L.marker([ [[+marker_coordinates]] ], /*{icon: icon}*/)
        .addTo(map)
        .bindPopup('[[+marker_popup:nl2br:stripForJS]]')
</script>