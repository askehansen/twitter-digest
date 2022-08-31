import { Controller } from "@hotwired/stimulus"
import jstz from "jstimezonedetect"

export default class extends Controller {
  static targets = [ "input" ]
  connect () {
    this.inputTarget.value = jstz.determine().name()
  }
}
