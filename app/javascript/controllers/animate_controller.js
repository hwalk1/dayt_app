import { Controller } from "stimulus"
import animate from 'animate.css';

export default class extends Controller {
  connect() {
    console.log('hello animation')
    if (localStorage.getItem('animate')) this.element.classList.add('animate__animated', 'animate__slideInDown')
    setTimeout(() => {
      localStorage.setItem('animate', '')
    }, 1000);
  }
}
