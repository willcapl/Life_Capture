// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
// import { Application,Controller } from "stimulus"
// // import "faq_controller"from ".controllers/faq_controller.js"
import QuestionButtonController from "./controllers/question_button_controller.js"
Stimulus.register("next-button", QuestionButtonController)

import { initRecordVideo } from './controllers/record_video.js';
document.addEventListener('turbo:load', () => {
  if(document.querySelector("#live")) {
    initRecordVideo();
  }
});
