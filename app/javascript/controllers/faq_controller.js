import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="faq"
export default class extends Controller {
  static targets = [
    "oneDropdown",
    "twoDropdown",
    "threeDropdown",
    "fourDropdown",
    "fiveDropdown",
    "oneCaret",
    "twoCaret",
    "threeCaret",
    "fourCaret",
    "fiveCaret",
  ]
  connect() {
    console.log("hello")
  }

  reveal(event) {
    console.log(event.target.classList)
    console.log("I can hear you!")
    console.log(this.LCdropdownTarget)

    if (event.target === this.oneCaretTarget) {
      this.oneDropdownTarget.classList.toggle("d-none")
    } else if (event.target === this.twoCaretTarget) {
      this.twoDropdownTarget.classList.toggle("d-none")
    } else if (event.target === this.threeCaretTarget) {
      this.threeDropdownTarget.classList.toggle("d-none")
    } else if (event.target === this.fourCaretTarget) {
      this.fourDropdownTarget.classList.toggle("d-none")
    } else if (event.target === this.fiveCaretTarget) {
      this.fiveDropdownTarget.classList.toggle("d-none")
    }

  }
}
