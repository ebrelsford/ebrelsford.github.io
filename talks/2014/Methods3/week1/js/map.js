function initializeFinalMap() {
    var map = L.map('final-map', {
        center: [40.7142, -73.9799],
        keyboard: false,
        scrollWheelZoom: false,
        zoom: 12
    });

    var bids = L.geoJson(bidsFeatures, {
        onEachFeature: function (feature, layer) {
            layer.bindPopup(feature.properties.NAME);
        },

        style: {
            color: '#FF0000',
            fillOpacity: 0.8
        }
    }).addTo(map);

    var toner = new L.StamenTileLayer('toner');
    map.addLayer(toner);
}

$(document).ready(function () {
    initializeFinalMap();
});
