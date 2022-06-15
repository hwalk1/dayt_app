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
      this.element.classList.add('add')

      this.progressBar()
    } else {
      this.buttonTarget = this.declineButtonTarget
      this.iconTarget = this.declineIconTarget
      this.element.classList.add('remove')
    }

    this.buttonTarget.disabled = true
    this.iconTarget.classList.add('fa-solid')

    this.parent = this.element.parentElement

    setTimeout(() => {
      this.element.remove()
    }, 700);

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(event.currentTarget)
    })
    .then(response => response.text())
    .then((data) => {
      if (data) {
        this.parent.insertAdjacentHTML('beforeend', data)
      }
    })
  }

  progressBar () {
    console.log(this.durationTarget.innerText)
    const addedTime = parseInt(this.durationTarget.innerText)
    const timeLeftContainer = document.querySelector('.time-left')

    const timeAdded = document.querySelector('#time-added')
    const timeLeft = document.querySelector('#time-left')
    console.log(timeAdded, timeLeft) + addedTime

    timeAdded.innerText = parseInt(timeAdded.innerText) + addedTime
    timeLeft.innerText = parseInt(timeLeft.innerText) - addedTime

    const progressBar = document.querySelector('.progress-bar')
    const currentProgress = parseInt(progressBar.style.width.slice(0, -1))
    const newProgress = addedTime * 12.5

    const totalProgress = currentProgress + newProgress

    if (totalProgress >= 100) timeLeftContainer.remove()

    progressBar.style.width = `${totalProgress}%`

    totalProgress >= 70 && progressBar.classList.add('bg-warning')
    totalProgress >= 100 && progressBar.classList.add('bg-danger')
  }
}
