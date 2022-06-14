import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('Hello, results!')
    const inputs = document.querySelectorAll('input')
    // inputs.each((inputs) => { |input| input.setAttribute("data-action", "onBlur->results#update"); })
  }

  update () {
    console.log(updating)
  }
}
