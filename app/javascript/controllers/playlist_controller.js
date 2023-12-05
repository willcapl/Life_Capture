import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

    // this.element.textContent = "Hello World!"
  }
  background(event){
    console.log("hello")
    event.target.parentElement.parentElement.classList.toggle("playlist-section-background")
    console.log(event.target.parentElement.previousElementSibling.previousElementSibling.firstChild.nextElementSibling)
    event.target.parentElement.previousElementSibling.previousElementSibling.firstChild.nextElementSibling.classList.toggle("d-none")
  }
}
