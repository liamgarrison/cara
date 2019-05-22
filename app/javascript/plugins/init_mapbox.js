import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    console.log(mapElement.dataset.markers);
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 6,
      scrollZoom: false,
      center: [0.1278, 51.5074]
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const el = document.createElement('i')
      el.className = 'fas fa-map-marker-alt marker'
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
        .setHTML('<h3 class="mt-3 mx-2 font-weight-bold">' + marker.name + '</h3><p class="mx-2">£' + marker.price_per_night + ' per night</p>'))
        .addTo(map);
      });
    const fitMapToMarkers = (map, markers) => {
      console.log(markers)
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 12 });
    };
    fitMapToMarkers(map, markers);
  };
};



export { initMapbox };
