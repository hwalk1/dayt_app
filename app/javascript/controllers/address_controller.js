import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// To fill the address field on the new/edit dayt pages
export default class extends Controller {
  // get api key from html
  static values = { apiKey: String }
  // get the location from the address input field
  static targets = ["location"]

  connect() {
    // use mapbox geocoder and the api key to make an api call
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      // use all address types
      types: "country,region,place,postcode,locality,neighborhood,address"
    });
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }
  // when the result is clicked, set the input value to result
  #setInputValue(event) {
    this.locationTarget.value = event.result["place_name"]
  }

  // when there is no result, clear the input value
  #clearInputValue() {
    this.locationTarget.value = ""
  }
}
