import { Controller } from "stimulus"
import Waves from "node-waves";

// this controller is present on every page
// this applies the waves animation to buttons with the associated classes
// for a full list of options, visit the waves documentation
export default class extends Controller {
  connect() {
    Waves.attach('.waves', ['waves-button', 'waves-float'])
    Waves.attach('.waves-flat', ['waves-button'])
    Waves.init()
  }
}
