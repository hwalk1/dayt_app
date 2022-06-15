import { Controller } from "stimulus"
import confetti from 'canvas-confetti';

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
        console.log(data.classList)
        this.parent.insertAdjacentHTML('beforeend', data)
      }
    })
  }

  progressBar () {
    const addedTime = parseInt(this.durationTarget.innerText)
    const timeAdded = document.querySelector('#time-added')
    const timeLeft = document.querySelector('#time-left')

    if (timeLeft) {
      this.timeLeftContainer = document.querySelector('.time-left')


      timeAdded.innerText = parseInt(timeAdded.innerText) + addedTime
      timeLeft.innerText = parseInt(timeLeft.innerText) - addedTime
    }

    const progressBar = document.querySelector('.progress-bar')
    const currentProgress = parseInt(progressBar.style.width.slice(0, -1))
    const newProgress = addedTime * 12.5

    const totalProgress = currentProgress + newProgress

    if (totalProgress >= 99 && timeLeft) this.timeLeftContainer.remove()

    progressBar.style.width = `${totalProgress}%`

    totalProgress >= 70 && progressBar.classList.add('bg-warning')

    if (totalProgress >= 95 && localStorage.getItem("confetti")) this.#confetti()
  }

  #confetti() {
    localStorage.setItem("confetti", '')
    var count = 200;
    var defaults = {
      origin: { y: 0.7 }
    };

    function fire(particleRatio, opts) {
      confetti(Object.assign({}, defaults, opts, {
        particleCount: Math.floor(count * particleRatio)
      }));
    }

    fire(0.25, {
      spread: 26,
      startVelocity: 55,
    });
    fire(0.2, {
      spread: 60,
    });
    fire(0.35, {
      spread: 100,
      decay: 0.91,
      scalar: 0.8
    });
    fire(0.1, {
      spread: 120,
      startVelocity: 25,
      decay: 0.92,
      scalar: 1.2
    });
    fire(0.1, {
      spread: 120,
      startVelocity: 45,
    });
  }
}
