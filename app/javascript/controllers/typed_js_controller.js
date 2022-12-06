import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'
// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
      new Typed(this.element, {
        strings: ["Tool box", "Pour les développeurs", "Designers", "Et surtout pour les wagonners !"],
        typeSpeed: 50,
        loop: true
  })
  }
}