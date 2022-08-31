import { Controller } from "@hotwired/stimulus"
import lottie from "lottie-web"

export default class extends Controller {
  connect () {
    this.player = lottie.loadAnimation({
      container: this.element,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: this.element.dataset.src
    })
  }
  disconnect () {
    this.player.destroy()
  }
}
