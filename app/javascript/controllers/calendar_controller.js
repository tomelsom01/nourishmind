import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "toggleableElement" ]
  fire(){
    this.toggleableElementTarget.classList.toggle("d-none");
  }
}

console.log('calendar_controller.js loaded')
