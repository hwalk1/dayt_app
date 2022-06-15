import { Controller } from "stimulus";
import Swiper, {EffectCards} from 'swiper';

export default class extends Controller {
  connect() {
    console.log('Hello, swiper!')
    if (!localStorage.getItem("index")) localStorage.setItem("index", 0)

    this.swiper = new Swiper(".swiper", {
      modules:[EffectCards],
      effect: "cards",
      cardsEffect: {
        slideShadows: false,
      },
      observer: true,
      initialSlide: localStorage.getItem("index"),
      // preventClicks: false,
      // preventClicksPropagation: false,
      // grabCursor: true
    });
  }

  index() {
    localStorage.setItem("index", this.swiper.activeIndex);
  }

  move() {
    // this.swiper.slides[this.swiper.activeIndex + 1].classList.add('move');
  }
}
