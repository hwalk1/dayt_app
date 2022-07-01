import { Controller } from "stimulus";
import Swiper, {EffectCards} from 'swiper';

// creates swiper cards on dayt index page using the swiperjs package
export default class extends Controller {
  connect() {
    // uses localStorage index to keep track of currently viewed slide between pages
    // if there is no localStorage index, set it to 0
    if (!localStorage.getItem("index")) localStorage.setItem("index", 0)

    // createnew swiper
    this.swiper = new Swiper(".swiper", {
      // use the effect cards effect
      modules:[EffectCards],
      effect: "cards",
      cardsEffect: {
        // remove shadows
        slideShadows: false,
      },
      // observes if cards are deleted so card position can be updated
      observer: true,
      // selects the slide the user starts on using localStorate index
      initialSlide: localStorage.getItem("index"),
    });
  }

  index() {
    // when going to expanded card page, set the active index to the slide chosen
    localStorage.setItem("index", this.swiper.activeIndex);
  }
}
