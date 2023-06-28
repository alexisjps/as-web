import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "menu", "overlay" ]

  toggle() {
    this.menuTarget.classList.add('active');
    this.overlayTarget.classList.toggle('active');
  }
  disable() {
    this.menuTarget.classList.remove('active');
    this.overlayTarget.classList.remove('active');
  }
}
