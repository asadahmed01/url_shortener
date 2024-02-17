import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  clear() {
    this.element.reset()
    this.element.querySelector("[autofocus='autofocus']")?.focus()
  }
}
