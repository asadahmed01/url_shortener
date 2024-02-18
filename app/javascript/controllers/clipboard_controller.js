import { Controller } from "@hotwired/stimulus"
import Clipboard from "clipboard"
export default class extends Controller {
  
  static values = {
    successMessage: { type: String, default: "Copied!" },
    errorMessage: { type: String, default: "Failed!" }
  }

  connect () {
    this.clipboard = new Clipboard(this.element)
    this.clipboard.on("success", (e) => this.tooltip("Copied!"))
    this.clipboard.on("error", (e) => this.tooltip("Failed!"))
  }

  disconnect() {
    this.clipboard.destory()
  }

  tooltip(message) {
    tippy(this.element, {
      content: message,
      showOnCreate: true,
      onHidden: (instance) => instance.destory()
    })
  }
}
