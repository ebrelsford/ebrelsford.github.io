function initializeMap() {
    var map = L.map('map', {
        center: [40.7142, -73.9799],
        keyboard: false,
        scrollWheelZoom: false,
        zoom: 12
    });

    var toner = new L.StamenTileLayer('toner');
    map.addLayer(toner);

    $.get('https://gist.github.com/ebrelsford/6478671/raw/b1e87041fff5108f5b1ea06d72da6f2cf8672210/citibike.geojson', function (data) {
        var data = L.geoJson(data, {
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
