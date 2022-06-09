import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "container", 'map' ]

  connect() {
    console.log('Hello, hide!')
  }

  toggle() {
    this.containerTarget.classList.toggle('d-none')
    this.mapTarget.classList.toggle('d-none')
  }
}
