import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dropdownElement"];

  toggle() {
    if (this.dropdownElementTarget.classList.contains("d-none")) {
      this.dropdownElementTarget.classList.remove("d-none");
    } else {
      this.dropdownElementTarget.classList.add("d-none");
    }
  }
}
