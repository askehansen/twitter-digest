import { Controller } from "stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  connect () {

    const consumer = createConsumer()
    consumer.subscriptions.create("NewDigestChannel", {
      connected: () => {
        console.log(this.element.dataset.digestPath)
        // Called when the subscription is ready for use on the server
      },

      disconnected: () => {
        // Called when the subscription has been terminated by the server
      },

      received: (data) => {
        if (data.status === "ready") {
          Turbolinks.visit(this.element.dataset.digestPath)
        }
        // Called when there's incoming data on the websocket for this channel
      }
    });


  }
}
