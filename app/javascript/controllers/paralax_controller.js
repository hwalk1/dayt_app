import { Controller } from "stimulus"
import animate from 'animate.css';

// this creates an animation of the dayts coming from above
// on the trip show page
export default class extends Controller {
  // set a target for every card
  static targets = ['card']

  connect() {
    // set a timeout variable to increase over each iteration
    this.timeout = 0
    // check for localStorage animate to determine whether to show the animation or not
    if (localStorage.getItem('animate')) {
      // set animate to a falsy value so that it doesn't repeat
      // as this animation would become annoying for users
      localStorage.setItem('animate', '')
      // iterate over each card
      this.cardTargets.forEach((card) => {
        setTimeout(() => {
          // add animation effects using the animate.css library
          card.classList.add('animate__fadeInDownBig', 'animate__animated', 'animate__fast')
          // remove the hidden class that each card starts with
          card.classList.remove('hide')
          //wait to perform this action based on this.timeout
        }, this.timeout);
        // increase this.timeout so the next card that comes will have a 100ms delay more
        // this creates an animation of each card coming down after eachother
        this.timeout += 100
      });
    } else {
      // if localStorage animate is falsy, don't play the animation
      // remove the hide class
      this.cardTargets.forEach(card => {
        card.classList.remove('hide')
      });
    }
  }
}
