import { Controller } from "stimulus"
import animate from 'animate.css';

// for the hand animation on the trip itinerary page.
// to prompt the user the cards are moveable
export default class extends Controller {
  connect() {
    setTimeout(() => {
      // wait 1 second before beginning to move the hand and make it visible.
      // this is to allow time to load in and to make the animation more noticeable
      this.element.classList.add('move-hand')
      setTimeout(() => {
        // wait 1.5 seconds, the same time of the transition, to remove the class
        // beginning the reverse animation
        this.element.classList.remove('move-hand')
        setTimeout(() => {
          // remove the element following the completion of the return animation
          this.element.remove()
        }, 1500);
      }, 1500);
    }, 1000);

  }
}
