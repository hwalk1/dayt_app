import { Controller } from "stimulus"
import flatpickr from "flatpickr";

// for nicer looking date picking on desktop on the trip preferences page
export default class extends Controller {
  connect() {
    // once connected, add flatpickr to the when? input field
    // consult flatpickr docs for more options
    flatpickr(".datepicker", {
      allowInput: true,
      altInput: true,
      altFormat: "j F, Y",
      position: 'auto center'
    });
  }
}
