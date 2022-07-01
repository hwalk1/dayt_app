import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// For helping the user pick cities or towns by creating results from their input
// located on the trip preferences page for where?
export default class extends Controller {
  // get the api key form the html
  static values = { apiKey: String }
   // get the location from the address input field
  static targets = ["location"]

  connect() {
     // use mapbox geocoder and the api key to make an api call
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      // only cities and towns, consult mapbox docs for more options
      types: "place,locality,neighborhood"
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
