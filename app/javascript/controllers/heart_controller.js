import { Controller } from "@hotwired/stimulus"

// To add filled heart on click on the dayt show page
export default class extends Controller {
  static targets =['heart']
  connect() {
  }

  // triggered on click
  fill() {
    this.heartTarget.classList.add('fa-solid')
  }
}
