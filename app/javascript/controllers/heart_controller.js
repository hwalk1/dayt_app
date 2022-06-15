import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets =['heart']
  connect() {
    console.log('hello heart')
  }

  fill() {
    this.heartTarget.classList.add('fa-solid')
  }
}
