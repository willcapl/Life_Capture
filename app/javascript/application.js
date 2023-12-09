// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import QuestionButtonController from "./controllers/question_button_controller.js"
Stimulus.register("next-button", QuestionButtonController)

import { initRecordVideo } from './controllers/record_video.js';
document.addEventListener('turbo:load', () => {
  if(document.querySelector("#live")) {
    initRecordVideo();
  }
});

document.addEventListener("turbo:load", (event) => {
  let googleId = documen.querySelector("meta[name='google-analytics-id]").content
  if (googleId) {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', googleId);
  }

})
