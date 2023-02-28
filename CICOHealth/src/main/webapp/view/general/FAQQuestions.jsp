<%-- 
    Document   : FAQQuestions
    Created on : Feb 28, 2023, 1:29:36 PM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <title>View FAQ FOR ADMIN</title>
</head>

<body>
    <h1>Frequently Asked Questions</h1>
    <div class="select-container-fluid">
        <form id="select-form">
            <div class="no-gutters">
                <div class="select-topic">
                    <select class="form-control">
                        <option value="1">Default all topics</option>
                        <option value="2">Topic B</option>
                        <option value="3">Topic C</option>
                        <option value="4">Topic A</option>
                        <option value="5">Topic D</option>
                        <option value="6">Topic E</option>
                        <option value="7">Topic F</option>
                    </select>
                </div>
            </div>
        </form>
    </div>

    <div class="faq-container">
        <div class="faq" id="faq-1">
            <h3 class="faq-title">
                What is a Stand ability?
            </h3>
            <p class="faq-text">
                <b>Question topic:</b> Topic A  <br>              
                <b>Question sender name (optional):</b> Le Duy Khanh
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq-admin ">
            <a href="#"><i class="fa-solid fa-message btn-answer"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>


        <div class="faq" id="faq-2">
            <h3 class="faq-title">
                What grants Stand ability?
            </h3>
            <p class="faq-text">
                <b>Question topic:</b> Topic B  <br>              
                <b>Question sender name (optional):</b> Vo Huynh Tan Quang
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq-admin ">
            <a href="#"><i class="fa-solid fa-message btn-answer"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>

        <div class="faq" id="faq-3">
            <h3 class="faq-title">
                What are the Stand stats?
            </h3>
            <p class="faq-text">
                <b>Question topic:</b> Topic C  <br>              
                <b>Question sender name (optional):</b> Pham Gia Quan
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq-admin ">
            <a href="#"><i class="fa-solid fa-message btn-answer"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>

        <div class="faq" id="faq-4">
            <h3 class="faq-title">
                What are the forms of Stands?
            </h3>
            <p class="faq-text">
                <b>Question topic:</b> Topic E  <br>              
                <b>Question sender name (optional):</b> Le Nhat Phat
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq-admin ">
            <a href="#"><i class="fa-solid fa-message btn-answer"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>
    </div>

    <!-- pop-up-answer -->
    <div class="pop-up answer-pop-up" id="answer-pop-up">
        <div class="answer-overlay overlay" id="overlay"></div>
        <div class="pop-up-content answer-pop-up-content">
            <form action="answer-log" method="post" name="answer-form" class="answer-form">
                <h2 class="txt-title-pop-up">Edit Answer</h2>
                <div class="form-group row">
                    <label for="txtAnswerContent" class="offset-1 col-3 col-form-label">Question topic</label>
                    <div class="col-7">
                        <select name="txtAnswerContent" id="txtAnswerContent" class="form-control" disabled>
                            <option value="1">Default all topics</option>
                            <option value="2">Topic B</option>
                            <option value="3">Topic C</option>
                            <option value="4">Topic A</option>
                            <option value="5">Topic D</option>
                            <option value="6">Topic E</option>
                            <option value="7">Topic F</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtName" class="offset-1 col-3 col-form-label">Question content</label>
                    <div class="col-7">
                        <textarea id="txtQuestionContent" name="txtQuestionContent" cols="10" rows="3" class="form-control" readonly></textarea>
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

    <div class="wrapper">
        <footer>
            <div class="row block-footer">
                <div class="offset-1 col-3 footer-content">
                    <span class="school-name"><strong>FPT University Can Tho</strong></span>
                    <p>600, Nguyen Van Cu, An Binh, Ninh Kieu, Can Tho</p>
                    <p>Phone: (0292) 360 1996</p>
                    <p>Email: fptu.cantho@fe.edu.vn</p>
                </div>
                <div class="offset-1 col-3 footer-content">
                    <p>Le Duy Khanh</p>
                    <p>Pham Nhat Quang</p>
                    <p>Vo Hong Quan</p>
                    <p>Huynh Gia Khiem</p>
                    <p>Pham Tan Phat</p>
                </div>
                <div class="col-3 footer-content">
                    <p>© 2023 All rights reserved. Our website services, content, and products are for informational
                        purposes only. Nutrition does not provide medical advice, diagnosis, or treatment.</p>
                </div>
            </div>
        </footer>
    </div>
</body>
<script src="/CICOHealth/assets/scripts/faq.js"></script>
<script src="/CICOHealth/assets/scripts/popup.js"></script>

</html>