import { Controller } from "@hotwired/stimulus"

// to play an animated message on the home page
export default class extends Controller {

  connect() {
    const title = document.getElementById('title');
    // text to be animated
    const text = "Make the most out of your trip";

    const animateText = (text, element, intervalDuration) => {
    let count = 0;
    const interval = setInterval(() => {
        // progressively add letter by letter
        const part = text.substring(0, ++count);
        // change the current text content to be the current total
        requestAnimationFrame(() => {
          element.textContent = part;
        });
        // stop animation once text is completely displayed
        if (count === text.length) {
          clearInterval(interval);
        }
      }, intervalDuration);
    };

    // set interval duration between letters to be 80ms
    animateText(text, title, 80);
  }

}
