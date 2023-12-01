import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["questionCard", "submitButton", "loadingMessage", "last"];

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
    this.updateProgressBar(0); // Initialize progress bar
  }

  reveal(event) {
    let currentQuestion = event.target.closest(".question-card");
    if (currentQuestion) {
      currentQuestion.classList.add("hide-question");
    }

    let nextQuestion = currentQuestion.nextElementSibling;
    if (nextQuestion && nextQuestion.classList.contains("question-card")) {
      nextQuestion.classList.remove("hide-question");
      this.checkLastQuestion(nextQuestion);
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
      let index = this.questionCardTargets.indexOf(previousQuestion);
      console.log("Previous Question Index:", index); // Debugging
      this.updateProgressBar(index);
    }
    this.checkLastQuestion(previousQuestion);
  }

  checkLastQuestion(question) {
    let isLastQuestion = !question.nextElementSibling;
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.style.display = isLastQuestion ? "block" : "none";
      this.loadingMessageTarget.style.display = "none";
    }
  }

  submit(event) {
    console.log('submitted');
  }
}
