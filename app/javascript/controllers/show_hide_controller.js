import { Controller } from "stimulus"

// to slide between the map view and the normal page view
// located on slider/dayt index, trip itinerary and trip show pages
export default class extends Controller {
  // sets a target for the div containing the normal page view and map view
  static targets = [ "slider"]

  // slides between pages
  toggle(event) {
    // toggling the slider class to map causes a y transition equal to the screen height
    // moving the user's view to the map
    // toggling it off removes that y transformation and brings the user back to the normal page view
    // because overflow is hidden and the view height for the page is set, the user cannot scroll to the map
    this.sliderTarget.classList.toggle('show-map')
    // toggle the button class to reverse the background and text colors
    event.currentTarget.classList.toggle('btn-map-show')
    // change the words inside the button depending on the view
    // shows where the button will take you
    // if in normal view, the text is 'Dayts'
    // else in the map view, the text is 'Map'
    if (this.sliderTarget.classList.contains('show-map')) {
      event.currentTarget.innerText = 'Dayts'
    } else {
      event.currentTarget.innerText = 'Map'
    }
  }
}
