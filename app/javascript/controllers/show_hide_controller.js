import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slider" ]

  connect() {
    console.log('Hello, hide!')
  }

  toggle() {
    console.log('sliding')
    this.sliderTarget.classList.toggle('show-map')
  }
}
