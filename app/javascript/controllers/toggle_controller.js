import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "menu", "overlay" ]

  toggle() {
    this.menuTarget.classList.toggle('active');
    this.overlayTarget.classList.toggle('active');
  }
}
