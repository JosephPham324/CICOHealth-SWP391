//Import all from the faq.js file
import {
  collapseFAQ,
  newQuestionFormPopUp,
  editAnswerButtons,
  createAnswerButtons,
} from "./modules/faq.js";

let answers = [];
let role;
//On page load, query /CICOHealth/faq/answers/data for all answers
window.addEventListener("load", () => {
  //Get all answers
  fetch("/CICOHealth/faq/answers/data?topic=All")
    .then((response) => response.json())
    .then((answersRes) => {
        console.log(answersRes);
      answers = answersRes.answers;
      role = answersRes.userRole;
      createFAQs(answersRes.answers);
    });
});

function initializeFaqBehavioursFull() {
  collapseFAQ();
  newQuestionFormPopUp();
  editAnswerButtons();
  createAnswerButtons();
}
function initializeFaqBehaviours() {
  collapseFAQ();
  newQuestionFormPopUp();
}

function createFAQs(answers) {
  let faqContainer = document.querySelector("#faq-container");
  faqContainer.innerHTML = "";
  let count = 1;
  answers.forEach((answer) => {
    let faqHtml = `
        <div class="faq" id="faq-${count++}">
            <h3 class="faq-title">
                ${answer.questionContent}
            </h3>
            <p class="faq-text">
                ${answer.answerContent}
            </p>
            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        `;
        console.log(role)
    if (role === "AD") {
      console.log('admin here')
      faqHtml += `
            <div class="faq-buttons">
                <button class="btn btn-edit btn-answer" data-id="${answer.answerID}">
                    <i class="fas fa-edit"></i>
                </button>
                <button class="btn btn-delete" data-id="${answer.answerID}">
                    <i class="fas fa-trash"></i>
                </button>
            </div>
            `;
    }
    faqContainer.innerHTML += faqHtml;
  });
  if (role === "AD") {
    initializeFaqBehavioursFull();
    ansEditFormButtonsClickEvent();
    btnDeleteClickEvent();
  } else {
    initializeFaqBehaviours();
  }
}

function btnDeleteClickEvent() {
  let deleteButtons = document.querySelectorAll(".btn-delete");
  deleteButtons.forEach((button) => {
    button.addEventListener("click", () => {
      let frmParams = {
        _method: "DELETE",
        answerID: button.dataset.id,
      };
      if (confirm("Are you sure you want to delete this answer?")) {
        post("/CICOHealth/faq/answers", frmParams);
      }
    });
  });
}

function ansEditFormButtonsClickEvent() {
  let buttons = document.querySelectorAll(".btn-answer");
  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      console.log(answers);
      console.log(button.dataset.id);
      let answer = answers.find(
        (answer) => answer.answerID == button.dataset.id
      );
      fillEditAnswerForm(answer);
    });
  });
}

function fillEditAnswerForm(answer) {
  console.log(answer);
  console.log(answer.questionContent);
  document.querySelector("#answerID").value = answer.answerID;
  document.querySelector("#createdBy").value = answer.createBy;
  //Set selected index to that of the answer's topic
  document.querySelector("#txtAnswerQuestionTopic").selectedIndex =
    answer.topic;
  console.log(document.querySelector("#txtQuestionContent"));
  document.querySelector("#txtAnswerQuestionContent").innerText =
    answer.questionContent;
  document.querySelector("#txtAnswerContent").innerText = answer.answerContent;
}

document.getElementById("edit-answer").addEventListener("submit", (e) => {
  e.preventDefault();
  //Log question topic
  let formParams = {
    _method: "PUT",
    answerID: document.querySelector("#answerID").value,
    createdBy: document.querySelector("#createdBy").value,
    topic: document.querySelector("#txtAnswerQuestionTopic").value,
    questionContent: document.querySelector("#txtAnswerQuestionContent").value,
    answerContent: document.querySelector("#txtAnswerContent").value,
  };
  post("/CICOHealth/faq/answers", formParams);
});
