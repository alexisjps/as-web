import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast-boostrap"
export default class extends Controller {
  connect() {
const toastTrigger = document.getElementById('liveToastBtn')
const toastLiveExample = document.getElementById('liveToast')
if (toastTrigger) {
  toastTrigger.addEventListener('click', () => {
    const toast = new bootstrap.Toast(toastLiveExample)

    toast.show()
  })
}
const toastTrigger2 = document.getElementById('liveToastBtn2')
const toastLiveExample2 = document.getElementById('liveToast2')
if (toastTrigger2) {
  toastTrigger2.addEventListener('click', () => {
    const toast2 = new bootstrap.Toast(toastLiveExample2)

    toast2.show()
  })
}
const toastTrigger3 = document.getElementById('liveToastBtn3')
const toastLiveExample3 = document.getElementById('liveToast3')
if (toastTrigger3) {
  toastTrigger3.addEventListener('click', () => {
    const toast3 = new bootstrap.Toast(toastLiveExample3)

    toast3.show()
  })
}
const toastTrigger4 = document.getElementById('liveToastBtn4')
const toastLiveExample4 = document.getElementById('liveToast4')
if (toastTrigger4) {
  toastTrigger4.addEventListener('click', () => {
    const toast4 = new bootstrap.Toast(toastLiveExample4)

    toast4.show()
  })
}
  }
}
