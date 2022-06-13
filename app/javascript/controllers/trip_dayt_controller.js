import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['acceptButton', 'declineButton', 'acceptIcon', 'declineIcon', 'duration']

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

      this.progressBar()
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


      if (data) {
        this.element.innerHTML = data
      } else {
        this.element.remove()
      }
    })
  }

  progressBar () {
    console.log(this.durationTarget.innerText)

    const progressBar = document.querySelector('.progress-bar')
    const currentProgress = parseInt(progressBar.style.width.slice(0, -1))
    const newProgress = parseInt(this.durationTarget.innerText) * 10
    const totalProgress = currentProgress + newProgress

    progressBar.style.width = `${totalProgress}%`

    totalProgress >= 70 && progressBar.classList.add('bg-warning')
    totalProgress >= 100 && progressBar.classList.add('bg-danger', 'shake')
  }
}
