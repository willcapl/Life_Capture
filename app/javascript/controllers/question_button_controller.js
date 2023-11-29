import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["questionCard"]

  connect() {
    console.log("Question button controller connected");
    this.initializeQuestionVisibility();
  }

  initializeQuestionVisibility() {
    this.questionCardTargets.forEach((card, index) => {
      if (index === 0) {
        card.classList.remove("hide-question");
      } else {
        card.classList.add("hide-question");
      }
    });
  }
  reveal(event) {
    let currentQuestion = event.target.closest(".question-card");
    if (currentQuestion) {
      currentQuestion.classList.add("hide-question");
    }

    let nextQuestion = currentQuestion.nextElementSibling;
    if (nextQuestion && nextQuestion.classList.contains("question-card")) {
      nextQuestion.classList.remove("hide-question");
    }
  }

  back(event) {
    let currentQuestion = event.target.closest(".question-card");
    if (currentQuestion) {
      currentQuestion.classList.add("hide-question");
    }

    let previousQuestion = currentQuestion.previousElementSibling;
    if (previousQuestion && previousQuestion.classList.contains("question-card")) {
      previousQuestion.classList.remove("hide-question");
    }
  }
}
