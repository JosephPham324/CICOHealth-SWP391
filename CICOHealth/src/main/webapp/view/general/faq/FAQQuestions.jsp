<%-- Document : FAQQuestions Created on : Feb 28, 2023, 1:29:36 PM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        ${initParam.Bootstrap}
        ${initParam.DataTableCDN}
        ${initParam.FontAwesome}
        ${initParam.JqueryValidation}
        <link rel="shortcut icon" type="image/x-icon" href="../logo.png" />
        <link rel="stylesheet" type="text/css" href="/CICOHealth/assets/sass/main/faq.css" />
        <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css" />

        <title>View FAQ FOR ADMIN</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>

        <h1>Frequently Asked Questions</h1>
        <div class="select-container-fluid">
            <form id="select-form">
                <div class="no-gutters">
                    <div class="select-topic">
                        <select class="form-control">
                            <option value="All">All</option>
                            <option value="General">General</option>
                            <option value="Logging">Logging</option>
                            <option value="Statistics">Statistics</option>
                            <option value="Terminologies">Terminologies</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="faq-container" id="faq-container"></div>

        <!-- pop-up-answer -->
        <div class="pop-up answer-pop-up" id="answer-pop-up">
            <div class="answer-overlay overlay" id="overlay"></div>
            <div class="pop-up-content answer-pop-up-content">
                <form action="/CICOHealth/faq/answers" method="post" name="answer-form" class="answer-form" id="answer-form">
                    <h2 class="txt-title-pop-up">Answer This Question</h2>
                    <div class="form-group row">
                        <label for="txtQuestionTopic" class="offset-1 col-3 col-form-label">Question topic</label>
                        <div class="col-7">
                            <select name="txtQuestionTopic" id="txtQuestionTopic" class="form-control" disabled>
                                <option value="General">General</option>
                                <option value="Logging">Logging</option>
                                <option value="Statistics">Statistics</option>
                                <option value="Terminologies">Terminologies</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtName" class="offset-1 col-3 col-form-label">Question content</label>
                        <div class="col-7">
                            <textarea id="txtQuestionContent" name="txtQuestionContent" cols="10" rows="3" class="form-control"
                                      >
                            </textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtAnswerContent" class="offset-1 col-3 col-form-label">Answer content</label>
                        <div class="col-7">
                            <textarea id="txtAnswerContent" name="txtAnswerContent" cols="10" rows="3"
                                      class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-5 col-2">
                            <button name="btn-submit" type="submit" class="btn btn-submit" id="btn-submit">
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/view/general/footer.jsp" %>

    </body>
    <script type="module" src="/CICOHealth/assets/scripts/faqQuestion.js"></script>
    <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
    <script src="/CICOHealth/assets/scripts/popup.js"></script>

</html>