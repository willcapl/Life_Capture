import { Controller } from "@hotwired/stimulus"
import { Sortable } from "@shopify/draggable";
// Connects to data-controller="draggable"
export default class extends Controller {
  static targets = [ "list" ]
  connect() {
    console.log('draggable controller connected');
    const swappable = new Sortable(this.listTarget, {
      draggable: "li",
      onEnd: (event) => {
        console.log(event);
        console.log('hello');
      },
      onStart: (event) => {
        console.log("object");
      },
      onMove: (event) => {
        console.log("object");
      },
    });
  }

}
