import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="question-button"
export default class extends Controller {

  static targets = ["next-question","previous-question"]

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  reveal(){
    console.log("button clicked");
  }

  back(){
    console.log("button back clicked");
  }

}
