import { Controller } from "stimulus"
import animate from 'animate.css';

export default class extends Controller {
  static targets = ['card']

  connect() {
    console.log('hello paralax')
    this.timeout = 0
     if (localStorage.getItem('animate')) {
       this.cardTargets.forEach((card) => {
         setTimeout(() => {
           card.classList.add('animate__fadeInDownBig', 'animate__animated', 'animate__fast')
           card.classList.remove('hide')
         }, this.timeout);
         this.timeout += 100
       });
     } else {
      this.cardTargets.forEach(card => {
        card.classList.remove('hide')
      });
     }
    localStorage.setItem('animate', '')
  }
}
