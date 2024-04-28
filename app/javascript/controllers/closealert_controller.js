// app/javascript/controllers/closealert_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Close alert on click anywhere on the screen
    document.addEventListener('click', this.closeAlert.bind(this));
  }

  closeAlert(event) {
    const alertSuccess = document.querySelector('.alert.alert-success.close');
    const alertDanger = document.querySelector('.alert.alert-danger.closedanger');

    // Check if the click event happened inside the alert or its children
    if (!alertSuccess.contains(event.target) && !alertDanger.contains(event.target)) {
      // If click was outside the alert, hide the alert
      if (alertSuccess) {
        alertSuccess.classList.add('hidden');
      }
      if (alertDanger) {
        alertDanger.classList.add('hidden');
      }
    }
  }
}
