import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// To display a map from mapbox using location from dayts that are displayed on the page
export default class extends Controller {
  static values = {
    // get the api key from html
    apiKey: String,
    // get an array containing (lat,long) and other details of dayts that are being displayed
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      // use the newest mapbox style
      style: "mapbox://styles/mapbox/streets-v11"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // adds current user location
    this.map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true
      })
      );
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // create a popup containing the details of the dayt: name, locaiton, cost, time, ect.
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // set custom marker to be the first image of the dayt
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.map_marker

      // add the marker settings and add it to the map
      new mapboxgl.Marker(customMarker.firstChild)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    // fits the map to the markers that have been added
    // this is so the map starts with appropriate zoom
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
