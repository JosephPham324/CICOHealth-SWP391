import {
  collapseFAQ,
  newQuestionFormPopUp,
  editAnswerButtons,
  createAnswerButtons,
} from "./modules/faq.js";

let questions = [];
window.addEventListener("load", () => {
  //Get all answers
  fetch("/CICOHealth/faq/questions/data?topic=All")
    .then((response) => response.json())
    .then((questionsRes) => {
      console.log(questionsRes);
      createFAQQuestions(questionsRes.questions);
      questions = questionsRes.questions;
    });
});

function initializeFaqBehaviours() {
  collapseFAQ();
  createAnswerButtons();
}

function createFAQQuestions(questions) {
  let faqContainer = document.querySelector("#faq-container");
  faqContainer.innerHTML = "";
  let count = 1;
  questions.forEach((question) => {
    let faqHtml = `
        <div class="faq" id="faq-${count++}">
            <h3 class="faq-title">
                ${question.questionContent}
            </h3>
            <p class="faq-text">
                <b>Question topic:</b> ${
                  question.questionTopic
                }  <br>              
                <b>Question sender name (optional):</b> ${
                  question.submittedBy ?? "Anonymous"
                } <br>
            </p>
            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq-admin ">
            <a href="#"><i class="fa-solid fa-message btn-answer" data-id="${question.questionID}"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete" data-id="${question.questionID}"></i></a>
        </div>
          `;
    faqContainer.innerHTML += faqHtml;
  });
  initializeFaqBehaviours();
  btnDeleteClickEvent();
  ansFormButtonsClickEvent();
}

function btnDeleteClickEvent() {
    let deleteButtons = document.querySelectorAll(".btn-delete");
    deleteButtons.forEach((button) => {
      button.addEventListener("click", () => {
        let frmParams = {
          _method: "DELETE",
          questionID: button.dataset.id,
        };
        if ("Are you sure you want to delete this question?") {
          post("/CICOHealth/faq/questions", frmParams);
        }
      });
    });
  }
  
  function ansFormButtonsClickEvent() {
    let buttons = document.querySelectorAll(".btn-answer");
    buttons.forEach((button) => {
      button.addEventListener("click", () => {
        let question = questions.find(
          (question) => question.questionID == button.dataset.id
        );
        fillEditAnswerForm(question);
      });
    });
  }

function fillEditAnswerForm(question) {
    console.log(question);
    document.getElementById("txtQuestionTopic").value = question.questionTopic;
    document.getElementById("txtQuestionContent").value = question.questionContent;
}

document.getElementById("answer-form").addEventListener("submit", (e) => {
    e.preventDefault();
    //Log question topic
    let formParams = {
      questionTopic: document.querySelector("#txtQuestionTopic").value,
      questionContent: document.querySelector("#txtQuestionContent").value,
      answerContent: document.querySelector("#txtAnswerContent").value,
    };
    post("/CICOHealth/faq/answers", formParams);
    // console.log(document.querySelector("select[name='txtAnswerQuestionTopic']").value);
  });
  