function initializeMap() {
    var map = L.map('map', {
        center: [40.7142, -73.9799],
        keyboard: false,
        scrollWheelZoom: false,
        zoom: 12
    });

    var toner = new L.StamenTileLayer('toner');
    map.addLayer(toner);

    $.get('http://ebrelsford.neocities.org/citibike.json', function (data) {
        console.log(data);
        var layer = L.geoJson(data, {
            style: {
                color: '#FF0000',
                fillOpacity: 0.8
            }
        }).addTo(map);
    });
}

$(document).ready(function () {
    initializeMap();
});
