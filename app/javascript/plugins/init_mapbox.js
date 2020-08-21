// import mapboxgl from 'mapbox-gl';

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = "pk.eyJ1IjoiYWxleDF2b2x6IiwiYSI6ImNrZGE5b2NkeTB4Z20yeWs2NXF3cDU0YzkifQ.Gg9JoNWr5E2mXOUuv0U0kw";
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });




//     const markers = JSON.parse(mapElement.dataset.markers);

//     markers.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .addTo(map);
//     });
//     addMarkersToMap(map, markers);
//   }
// };

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };

// export {
//   initMapbox
// };

import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = "pk.eyJ1IjoiYWxleDF2b2x6IiwiYSI6ImNrZGE5b2NkeTB4Z20yeWs2NXF3cDU0YzkifQ.Gg9JoNWr5E2mXOUuv0U0kw";
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  map.on('load', () => {
    map.resize();
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
