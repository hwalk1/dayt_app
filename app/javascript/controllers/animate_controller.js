import { Controller } from "stimulus"
import animate from 'animate.css';

export default class extends Controller {
  connect() {
    console.log('hello animation')
    setTimeout(() => {
      this.element.classList.add('move-hand')
      setTimeout(() => {

        this.element.classList.remove('move-hand')
        setTimeout(() => {

          this.element.remove()
        }, 1500);
      }, 1500);
    }, 1000);

  }
}
