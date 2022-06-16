import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const title = document.getElementById('title');
    const text = "Make the most out of your trip";

    const animateText = (text, element, intervalDuration) => {
    let count = 0;
    const interval = setInterval(() => {
        const part = text.substring(0, ++count);
        requestAnimationFrame(() => {
          element.textContent = part;
        });
        if (count === text.length) {
          clearInterval(interval);
        }
      }, intervalDuration);
    };

    animateText(text, title, 80);
  }

}
