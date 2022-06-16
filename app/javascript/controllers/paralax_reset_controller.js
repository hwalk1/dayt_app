import { Controller } from "stimulus"

export default class extends Controller {
  connect () {
    console.log('hello reset')
    localStorage.setItem("animate", 1)
  }
}
