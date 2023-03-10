<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/x-icon" href="../logo.png">
    <link rel="stylesheet" type="text/css" href="/CICOHealth/assets/sass/main/faq.css">
    <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css">
    <title> View FAQ </title>
</head>
<body>
    <%@include file="/view/general/navbar.jsp" %>

    <h1>Frequently Asked Questions</h1>
    <div class="search-select-container-fluid">
        <form id="search-form">
            <div class="no-gutters">
                <div class="select-topic">
                    <select class="form-control" id = "topic-select">
                        <option value="All">All</option>
                        <option value="General">General</option>
                        <option value="Logging">Logging</option>
                        <option value="Statistics">Statistics</option>
                        <option value="Terminologies">Terminologies</option>
                    </select>
                </div>
                <div class="search-topic">
                    <input type="text" placeholder="Search..." class="form-control search-box" id="search" name="search">
                </div>
                <div class="btn-search">
                    <button type="submit" class="btn btn-base">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>

    <div class="faq-container" id="faq-container">
        
    </div>

    <!-- Question Wrapper -->
    <div class="question-wrapper">
        <input id="questionCheckbox" type="checkbox" class="question-checkbox">
        <label class="question" for="questionCheckbox">
            <a class="question-action btn-question-pop-up" href="#" title="Edit Question">
                <div class="question-button"><i class="fa-sold fa-question icon-question"></i></div>
            </a>
        </label>
    </div>

    <!-- pop-up-question -->
    <div class="pop-up question-pop-up" id="question-pop-up">
        <div class="question-overlay overlay" id="overlay"></div>
        <div class="pop-up-content question-pop-up-content">
            <form action="question-log" method="post" name="question-form" class="question-form">
                <h2 class="txt-title-pop-up">Edit Question</h2>
                <div class="form-group row">
                    <label for="txtQuestionTopic" class="offset-1 col-3 col-form-label">Question topic</label>
                    <div class="col-7">
                        <select name="questionTopic" id="txtQuestionTopic" class="form-control">
                            <option value="General">General</option>
                            <option value="Logging">Logging</option>
                            <option value="Statistics">Statistics</option>
                            <option value="Terminologies">Terminologies</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtName" class="offset-1 col-3 col-form-label">Sender (Optional)</label>
                    <div class="col-7">
                        <input id="txtName" name="submittedBy" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtQuestionContent" class="offset-1 col-3 col-form-label">Question</label>
                    <div class="col-7">
                        <textarea id="txtQuestionContent" name="questionContent" cols="10" rows="4" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="offset-5 col-2">
                        <button name="btn-submit" type="submit" class="btn btn-submit" id="btn-submit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- pop-up-edit -->
    <div class="pop-up answer-pop-up" id="answer-pop-up">
        <div class="answer-overlay overlay" id="overlay"></div>
        <div class="pop-up-content answer-pop-up-content">
            <form action="/CICOHealth/faq/answers" method="post" name="answer-form" class="answer-form" id = "edit-answer">
                <h2 class="txt-title-pop-up">Edit Answer</h2>
                <div class="form-group row">
                    <label for="txtAnswerQuestionTopic" class="offset-1 col-3 col-form-label">Question topic</label>
                    <div class="col-7">
                        <select name="txtAnswerQuestionTopic" id="txtAnswerQuestionTopic" class="form-control" disabled>
                            <option value="All">All</option>
                            <option value="General">General</option>
                            <option value="Logging">Logging</option>
                            <option value="Statistics">Statistics</option>
                            <option value="Terminologies">Terminologies</option>
                        </select>
                    </div>
                </div>
                <input type="hidden" name="_method" id="_method" value="PUT">
                <input type="hidden" name="answerID" id="answerID">
                <input type="hidden" name="createdBy" id="createdBy">
                <div class="form-group row">
                    <label for="txtName" class="offset-1 col-3 col-form-label">Question content</label>
                    <div class="col-7">
                        <textarea id="txtAnswerQuestionContent" name="txtAnswerQuestionContent" cols="10" rows="3" class="form-control" readonly></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtAnswerContent" class="offset-1 col-3 col-form-label">Answer content</label>
                    <div class="col-7">
                        <textarea id="txtAnswerContent" name="txtAnswerContent" cols="10" rows="3" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="offset-5 col-2">
                        <button name="btn-submit" type="submit" class="btn btn-submit" id="btn-submit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%@include file="/view/general/footer.jsp" %>

</body>
<script type="module" src="/CICOHealth/assets/scripts/faq.js"></script>
<script src="/CICOHealth/assets/scripts/popup.js"></script>
<script src="/CICOHealth/assets/scripts/formhandling.js"></script>
</html>
