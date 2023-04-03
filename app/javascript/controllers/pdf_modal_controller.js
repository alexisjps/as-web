import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap";

// Connects to data-controller="pdf-modal"
export default class extends Controller {
  static targets = ["modal", "iframe"];

  connect() {
    this.modalInstance = new Modal(this.modalTarget, { backdrop: 'static', keyboard: false });
  }

  show(event) {
    event.preventDefault();

    // Get the URL from the data-url attribute
    const url = event.currentTarget.dataset.url;

    // Set the iframe's src attribute to the URL
    this.iframeTarget.src = url;

    // Show the Bootstrap modal
    this.modalInstance.show();
  }

  hide() {
    this.modalInstance.hide();
  }

  // Add this method to clear the iframe's src attribute when the modal is hidden
  clearIframeSrc() {
    this.iframeTarget.src = "";
  }
}
