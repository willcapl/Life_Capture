import { Controller } from "@hotwired/stimulus";
import Typed from 'typed.js';

export default class extends Controller {
  static targets = ["questionCard", "submitButton", "loadingMessage", "last", "body", "loadingMessageOther", "bodyOther", 'form'];

  connect() {
    this.initializeQuestionVisibility();
    this.questionCardTargets.forEach((card) => {
      card.addEventListener("keyup", event => {
        if (event.key === "Enter") {
          this.reveal(event);
        }
      })
    })
  }

  initializeQuestionVisibility() {
    this.questionCardTargets.forEach((card, index) => {
      if (index === 0) {
        card.classList.remove("hide-question");
      } else {
        card.classList.add("hide-question");
      }
    }); // Initialize progress bar
  }


  reveal(event) {
    let currentQuestion = event.target.closest(".question-card");
    console.log(currentQuestion);
    if (currentQuestion) {
      currentQuestion.classList.add("hide-question");
    }

    let nextQuestion = currentQuestion.nextElementSibling;
    console.log(nextQuestion)
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
    }
    this.checkLastQuestion(previousQuestion);
  }

  checkLastQuestion(question) {
    let isLastQuestion = !question.nextElementSibling;
    if (this.questionCardTargets.indexOf(question) === 8) {
      console.log('submit btn');
      this.submitButtonTarget.disabled = false;
      this.submitButtonTarget.style.display = isLastQuestion ? "block" : "none";
    }
  }

  submit(event) {
    console.log('submit');
    this.formTarget.submit();
    this.bodyTarget.classList.add('d-none');
    this.loadingMessageTarget.classList.remove('d-none');
    new Typed('#element', {
      strings: ['Generating your personalised questions...', 'Thinking about your past...', 'Formulating intriguing questions to ask you...', 'Nearly there...', 'Almost there...', 'Anytime now...', 'Love Live Demos....', 'Is Demo day still happening?', 'This is not funny anymore.', 'Happy New Year'],
      typeSpeed: 60,
    });
    // Show loading message
    // this.loadingMessageTarget.class.display = "block";
    // Simulate an asynchronous action (replace with your actual submission logic)
      // Assuming submission is successful, you can redirect or perform other actions
      console.log("Form submitted successfully!");

  }

  submitOther(event) {
    console.log('submit');
    this.formTarget.submit();
    // Show loading message
    // this.loadingMessageTarget.class.display = "block";
    this.loadingMessageOtherTarget.classList.remove('d-none');
    this.bodyTarget.classList.add('d-none');
    new Typed('#element', {
      strings: ['Generating your personalised questions...', 'Thinking about your past...', 'Formulating intriguing questions to ask you...', 'Nearly there...', 'Almost there...', 'Anytime now...', 'This is getting embarrasing...', 'Okay, what time is it?', 'This is not funny anymore.', 'Im late for work...'],
      typeSpeed: 50,
    });
      console.log("Form submitted successfully!");
  }
}
