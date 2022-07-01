import { Controller } from "stimulus";

// this runs when viewing the trips preferences page
// To set localStorage variables to track state.
export default class extends Controller {
  connect() {
    // this sets the position for which slide should have focus on the swiper/dayt index page
    // it is set to the first slide to begin with
    localStorage.setItem("index", 0)
    // confetti is played on the swiper/dayt index page when the progress bar is filled.
    // This sets confetti to a truthy value so when it is called later, if this is truthy,
    // confetti will run. it is then set to a falsy value before running.
    // this ensures confetti is only set off the first time the progress bar is filled.
    localStorage.setItem("confetti", 1)
  }
}
