import { Controller } from "@hotwired/stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = ["input"]

  validate() {
    const input = this.inputTarget
    const formData = new FormData()
    formData.append(input.name, input.value)

    axios.post("/validate_form", formData)
      .then((response) => {
        this.handleSuccess(response)
      })
      .catch((error) => {
        this.handleError(error)
      })
  }

  handleSuccess(response) {
    // Code to handle success (e.g., remove error message)
  }

  handleError(error) {
    // Code to handle error (e.g., display error message)
  }
}
