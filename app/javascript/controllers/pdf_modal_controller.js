import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pdf-modal"
export default class extends Controller {
  static targets = ["iframe"];
  connect() {
    this.modalElement = this.element.querySelector("#pdfModal");
    (this.modalElement).on("hidden.bs.modal", () => {
      this.iframeTarget.src = "";
    });
  }

  show(event) {
    event.preventDefault();
    this.iframeTarget.src = event.currentTarget.dataset.pdfUrl;
    $(this.modalElement).modal("show");
  }
}
