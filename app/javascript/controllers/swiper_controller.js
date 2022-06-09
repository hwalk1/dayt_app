import { Controller } from "stimulus";
import Swiper, {EffectCards} from 'swiper';

export default class extends Controller {
  connect() {
    console.log('Hello, swiper!')

    const swiper = new Swiper(".swiper", {
      modules:[EffectCards],
      effect: "cards",
      cardsEffect: {
        slideShadows: false,
      }
      // preventClicks: false,
      // preventClicksPropagation: false,
      // grabCursor: true
    });
  }
}
