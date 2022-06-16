import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slider"]

  connect() {
    console.log('Hello, hide!')
  }

  toggle(event) {
    console.log('sliding')
    this.sliderTarget.classList.toggle('show-map')
    event.currentTarget.classList.toggle('btn-map-show')
    this.sliderTarget.classList.contains('show-map') ? event.currentTarget.innerText = 'Dayts' : event.currentTarget.innerText = 'Map'
  }
}
