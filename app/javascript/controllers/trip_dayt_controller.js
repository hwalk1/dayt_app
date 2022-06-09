import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('Hello, trip dayt!')
  }

  create (event) {
    event.preventDefault()
    const url = event.currentTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(event.currentTarget)
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
