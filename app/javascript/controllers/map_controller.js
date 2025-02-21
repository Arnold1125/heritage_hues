import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [139.6917, 35.6895], // Tokyo default center
      zoom: 11,
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    console.log(this.markersValue);
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popupContent = document.createElement("div");
      popupContent.innerHTML = `<h3>${marker.name}</h3><p>${marker.address}</p>`;
      popupContent.style.cursor = "pointer"; // Show clickable cursor
      popupContent.style.padding = "10px"; // Add padding for better clickability

      // Redirect when clicking anywhere on the pop-up
      popupContent.addEventListener("click", () => {
        window.location.href = marker.path;
      });

      const popup = new mapboxgl.Popup().setDOMContent(popupContent);

      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // Attach the pop-up
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
