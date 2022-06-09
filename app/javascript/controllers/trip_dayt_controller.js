import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log('Hello, trip dayt!')
  }

  create (event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      if (data) {
        this.element.innerHTML = data
      } else {
        this.element.remove()
      }

    })
  }
}
