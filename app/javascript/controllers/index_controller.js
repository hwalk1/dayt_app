import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log('Hello, index!')
    localStorage.setItem("index", 0)
  }
}
