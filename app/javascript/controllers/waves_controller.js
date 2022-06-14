import { Controller } from "stimulus"
import Waves from "node-waves";

export default class extends Controller {
  connect() {
    console.log('Hello, waves!')
    Waves.attach('.waves', ['waves-button', 'waves-float'])
    Waves.attach('.waves-flat', ['waves-button'])
    Waves.init()
  }
}
