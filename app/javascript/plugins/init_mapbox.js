import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    
    
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const newMarker = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
      
      newMarker.getElement().dataset.markerId = marker.id;
      newMarker.getElement().addEventListener('mouseenter', (e) => toggleCardHighligh(e));
      newMarker.getElement().addEventListener('mouseleave', (e) => toggleCardHighligh(e));

      // adding popups on hover
      // const element = newMarker.getElement()
      // element.id = 'marker'
      // element.addEventListener('mouseenter', () => popup.addTo(map));
      // element.addEventListener('mouseleave', () => popup.remove());

      // newMarker.setPopup(popup)
      // newMarker.addTo(map)

    });
    // padding: 70, maxZoom: 15
    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 });
    };

    fitMapToMarkers(map, markers);

    
  }
};

const toggleCardHighligh = (event) => {
  const shopName = document.querySelector(`[data-shop-id="${event.currentTarget.dataset.markerId}"]`);
  shopName.classList.toggle('highlight');
}

export { initMapbox };