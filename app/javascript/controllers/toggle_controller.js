import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "menu" ]

  connect(){
    console.log('hello from toggle controller stimulus')
  }
  toggle() {
    console.log('hello world')
    this.menuTarget.classList.add('active');
    // this.overlayTarget.classList.toggle('active');
    if (this.menuTarget.innerText == 'Menu'){
      this.menuTarget.innerText = "Fermer le menu"
    } else {
      this.menuTarget.innerText = 'Menu'
    }
  }
  disable() {
    this.menuTarget.classList.remove('active');
    // this.overlayTarget.classList.remove('active');
    if (this.menuTarget.innerText == 'Menu'){
      this.menuTarget.innerText = "Fermer le menu"
    } else {
      this.menuTarget.innerText = 'Menu'
    }
  }
}
