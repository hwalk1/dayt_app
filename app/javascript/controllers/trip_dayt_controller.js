import { Controller } from "stimulus"
import confetti from 'canvas-confetti';

// this controls the adding and removing of dayts from the dayt index page/swiper
// this involves sending information to the dayt controller to create new trip_dayts for adding or removing,
// filling up the progress bar when dayts are added
// and creating a confetti explosion when the progress bar is filled
// this controller is created for each dayt card on the page
export default class extends Controller {
  // create target from the accept/decline buttons and their icons and the dayt duration
  static targets = ['acceptButton', 'declineButton', 'acceptIcon', 'declineIcon', 'duration']

  create (event) {
    // prevent default button behaviour
    event.preventDefault()
    // get the url from the form action
    const url = event.currentTarget.action


    if (event.currentTarget.classList.contains('accept')) {
      // if the heart was chosen set the button and icon targets to that button
      this.buttonTarget = this.acceptButtonTarget
      this.iconTarget = this.acceptIconTarget
      // add the add class which causes the upwards add animation to the card
      this.element.classList.add('add')
      // run the progressBar function to fill the progress bar with the cards duration
      this.progressBar()
    } else {
      // if the cross was chosen set the button and icon targets to that button
      this.buttonTarget = this.declineButtonTarget
      this.iconTarget = this.declineIconTarget
      // add the remove class which causes the downwards remove animation to the card
      this.element.classList.add('remove')
    }

    // disable the button to avoid multiple clicking
    this.buttonTarget.disabled = true
    // add fa-solid class to fill in the heart or increase the thickness of the cross to provide feedback
    this.iconTarget.classList.add('fa-solid')

    this.parent = this.element.parentElement

    // set timeout equal to the animaiton time before removing the element
    setTimeout(() => {
      this.element.remove()
    }, 700);

    // send a post request to dayt#create with the form data, to create a trip_dayt
    // that is either accepted or declined
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(event.currentTarget)
    })
    .then(response => response.text())
    .then((data) => {
      // if receive data for a new card to be added to swiper, add it to the back of the swiper stack
      if (data) {
        this.parent.insertAdjacentHTML('beforeend', data)
      }
    })
  }

  progressBar () {
    // convert added dayt duration into integer
    const addedTime = parseInt(this.durationTarget.innerText)
    // select time-added - the running total in the progress bar
    const timeAdded = document.querySelector('#time-added')
    // select time-left - the remaining hours needed to fill the progress bar
    const timeLeft = document.querySelector('#time-left')

    // for progress bar to be full, 8 hours worth of activities need to be selected

    // if there is still time to be filled
    if (timeLeft) {
      this.timeLeftContainer = document.querySelector('.time-left')
      // parse the running total and add the duration from the dayt card
      timeAdded.innerText = parseInt(timeAdded.innerText) + addedTime
      // parse the total remaining time and remove the duration from the dayt card
      timeLeft.innerText = parseInt(timeLeft.innerText) - addedTime
    }

    const progressBar = document.querySelector('.progress-bar')
    // get the percentage filled of the progress bar by slicing the percentage off
    const currentProgress = parseInt(progressBar.style.width.slice(0, -1))

    // new progress is turn into a percentage with each hour being 12.5%
    const newProgress = addedTime * 12.5

    const totalProgress = currentProgress + newProgress

    // if the total progress is >= 99(%) and theres some time left, remove the remaining time counter
    if (totalProgress >= 99 && timeLeft) this.timeLeftContainer.remove()

    // set the current bar percentage to the new progress + '%'
    progressBar.style.width = `${totalProgress}%`

    // if the progress bar is above 70% full, add the bg-warning class to make it pink
    totalProgress >= 70 && progressBar.classList.add('bg-warning')
    // if the progress bar is above 95% full and confetti is truthy in localStorage, run confetti
    if (totalProgress >= 95 && localStorage.getItem("confetti")) this.#confetti()
  }

  #confetti() {
    // set confetti to '' to be falsy so it wont run again until the trip preference page is visited again
    localStorage.setItem("confetti", '')
    // the below confetti configuration was copied from the realistic look at: https://www.kirilv.com/canvas-confetti/
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
