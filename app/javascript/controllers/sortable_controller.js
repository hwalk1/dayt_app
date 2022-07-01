import { Controller } from "stimulus"
import Sortable from 'sortablejs';
import { end } from "@popperjs/core"

// allows user to reorder dayts on the itinerary page
export default class extends Controller {
  // set targets for the list of the cards, the cards and the invisible input
  // the invisible input keeps track of the state of the cards order
  static targets = ["list", "card", "input"]

  connect() {
    // create a sortable list using the sortablejs package
    Sortable.create(this.listTarget, {
      animation: 150,
      // on the end of the movement set the value of each invisible input field
      // to the current order of dayt_trip ids stored as index value on each card
      onEnd: (event) => {
        let i = 0;
        this.cardTargets.forEach((card) => {
          this.inputTargets[i].value = parseInt(card.dataset.indexValue);
          i++;
        })
      }
    });
  }
}
