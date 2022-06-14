import { Controller } from "stimulus"
import Sortable from 'sortablejs';
import { end } from "@popperjs/core"
// import { Controller } from 'Stimulus';

// <<< ------ original ------>>>

export default class extends Controller {
  static targets = ["list", "card", "input"]

  connect() {
    console.log("hello");
    Sortable.create(this.listTarget, {
      animation: 150,
      onEnd: (event) => {
        alert(`${event.oldIndex} moved to ${event.newIndex}`)
        this.cardTargets[event.oldIndex].dataset.indexValue = event.newIndex;
        this.cardTargets[event.newIndex].dataset.indexValue = event.oldIndex;
        let i = 0;
        this.cardTargets.forEach((card) => {
          this.inputTargets[i].value = card.dataset.indexValue;
          i++;
        })
      }
    });
  }
}


// document.addEventListener('turbolinks:load', () => {
//   var el = document.getElementById('hello-list');
//   if (el) {
//     var sortable = Sortable.create(el, {
//       animation: 150
//     });
//     var data
//     $('#sortable').find('li').each(function(i) {
//       data.push($(this).data('arrange'));
//   });
//   }
// })
