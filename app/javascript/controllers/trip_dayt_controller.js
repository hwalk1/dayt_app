import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['acceptButton', 'declineButton', 'acceptIcon', 'declineIcon']
  connect() {
    console.log('Hello, trip dayt!')
  }

  create (event) {
    event.preventDefault()
    const url = event.currentTarget.action

    if (event.currentTarget.classList.contains('accept')) {
      this.buttonTarget = this.acceptButtonTarget
      this.iconTarget = this.acceptIconTarget
      this.iconTarget.classList.add('fa-solid')
    } else {
      this.buttonTarget = this.declineButtonTarget
      this.iconTarget = this.declineIconTarget
    }

    this.buttonTarget.disabled = true
    this.iconTarget.classList.add('fa-solid')

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
