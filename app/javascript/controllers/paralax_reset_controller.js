import { Controller } from "stimulus"
// to set localStorage animate to a truthy value
// so that card animation is activated on the next page
// this is also ensuring this animation plays once on the following page
// this is located on the trip itinerary page
export default class extends Controller {
  connect () {
    localStorage.setItem("animate", 1)
  }
}
