// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import QuestionButtonController from "./controllers/question_button_controller.js"
Stimulus.register("next-button", QuestionButtonController)
