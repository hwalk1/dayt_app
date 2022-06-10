import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    console.log('Hello, flatpickr!')
    flatpickr(".datepicker", {
      allowInput: true,
      altInput: true,
      altFormat: "j F, Y",
      position: 'auto center'
    });
  }
}
