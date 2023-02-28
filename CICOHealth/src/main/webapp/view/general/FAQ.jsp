<%-- 
    Document   : FAQ.jsp
    Created on : Feb 28, 2023, 1:28:35 PM
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

    <title> View FAQ </title>
</head>

<body>
    <h1>Frequently Asked Questions</h1>
    <div class="search-select-container-fluid">
        <form id="search-form">
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

    <div class="faq-container">
        <div class="faq" id="faq-1">
            <h3 class="faq-title">
                What is a Stand ability?
            </h3>
            <p class="faq-text">
                A <b>Stand (スタンド Sutando)</b> is a visual manifestation of life energy (in other words, the
                manifestation of the soul of the user).<br>
                A Stand is an entity psychically generated by its owner, referred to as a <b>Stand User (スタンド使い
                    Sutando
                    Tsukai)</b>. It generally presents itself as a figure hovering over or near the user and
                possesses
                abilities beyond that of an ordinary human, which, depending on the Stand User, can be wielded for
                good
                or evil.
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>

        </div>
        <div class="btn-faq">
            <a href="#"><i class="fa-solid fa-edit btn-edit"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>


        <div class="faq" id="faq-2">
            <h3 class="faq-title">
                What grants Stand ability?
            </h3>
            <p class="faq-text">
                A Stand ability can be obtained by being struck by a Stand arrow (granted you survive it), or inherit
                from your bloodline, the most typical of this case is the Joestar bloodline and Dio (Giorno and all his
                other children have a Stand).<br>
                Additionally, Stand abilities can be passed from one person to another thanks to White Snake's ability,
                which can turn the Stand ability into a disc, then the disc can be put into another person.
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq">
            <a href="#"><i class="fa-solid fa-edit btn-edit"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>

        <div class="faq" id="faq-3">
            <h3 class="faq-title">
                What are the Stand stats?
            </h3>
            <p class="faq-text">

                <b>Destructive Power (破壊力 Hakairyoku)</b>: Measures the Stand's strength and ability to cause
                destruction (physical injury or collateral environmental damage) in a given period of time.<br>

                <b>Speed (スピード Supīdo)</b>: Measures the Stand's agility and reflexes as well as performance speed.<br>

                <b>Range (射程距離 Shatei Kyori)</b>: Measures a compromise of the Stand's range of manifestation, range of
                ability influence, and spatial mobility.<br>

                <b>Stamina (持続力 Jizoku-ryoku)</b>: Measures the duration of time that the Stand can actively maintain
                its ability. Long-Range Stands capable of operating remotely from their Users like Lovers and Empress
                are described as having high Stamina. This also applies to Materialized Stands like Yellow Temperance
                and Atom Heart Father that can bind to objects for long periods of time.<br>

                <b>Precision (精密動作性 Seimitsu Dōsa-sei)</b>: Measures the Stand's accuracy and range of influence/effect
                of their abilities to specified targets. Automatic type Stands are generally evaluated with Rank D or
                under with a few exceptions.<br>

                <b>Development Potential (成長性 Seichō-sei)</b>: Measures the Stand's possible functions, utilization of
                its abilities and powers, and capacity to improve its overall capabilities. It decreases in rank as the
                user masters their Stand.
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq">
            <a href="#"><i class="fa-solid fa-edit btn-edit"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>

        <div class="faq" id="faq-4">
            <h3 class="faq-title">
                What are the forms of Stands?
            </h3>
            <p class="faq-text">
                <b>Natural Humanoid</b>: Stands in this category have physical characteristics similar to human beings,
                most often their users. Obvious identifiable features include arms and legs, but the category distinctly
                specifies appendages that are reminiscent of the human muscular system as well as having working eyes
                and mouth.<br>
                <b>Artificial Humanoid</b>: While also having humanoid-like bodies, Stands in this category will often
                feature artificial or mechanical nuances that separate them from natural humanoids. This includes having
                completely non-humanoid facial features and mechanical joints. Appearances that resemble robots, cyborgs
                or androids are applicable here.<br>
                <b>Natural Non-Humanoid</b>: This category features Stands that, while not human-like, are reminiscent
                of other lifeforms or objects in nature. This includes basic organisms such as animals and plants, but
                also more unorthodox concepts such as fog. Stands that may be described as "monsters-like" are often
                applicable here.<br>
                <b>Artificial Non-Humanoid</b>: Stands comparable to instruments or mechanical objects are placed in
                this category. This includes vehicles, weapons, tools, and machines.<br>
                <b>Phenomenon</b>: Stands in this category typically either don't have clear appearances or are
                integrated into their user's appearance.
            </p>

            <button class="faq-toggle">
                <i class="fas fa-chevron-down"></i>
                <i class="fa-solid fa-chevron-up"></i>
            </button>
        </div>
        <div class="btn-faq">
            <a href="#"><i class="fa-solid fa-edit btn-edit"></i></a>
            <a href="#"><i class="fa-solid fa-trash btn-delete"></i></a>
        </div>
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
                        <select name="txtQuestionTopic" id="txtQuestionTopic" class="form-control">
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
                    <label for="txtName" class="offset-1 col-3 col-form-label">Sender (Optional)</label>
                    <div class="col-7">
                        <input id="txtName" name="txtName" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtQuestionContent" class="offset-1 col-3 col-form-label">Question</label>
                    <div class="col-7">
                        <textarea id="txtQuestionContent" name="txtQuestionContent" cols="10" rows="4" class="form-control"></textarea>
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
    <div class="pop-up edit-pop-up" id="edit-pop-up">
        <div class="edit-overlay overlay" id="overlay"></div>
        <div class="pop-up-content edit-pop-up-content">
            <form action="edit-log" method="post" name="edit-form" class="edit-form">
                <h2 class="txt-title-pop-up">Editing the content of the question</h2>
                <div class="form-group row">
                    <label for="txtEditQuestion" class="offset-1 col-3 col-form-label">Question</label>
                    <div class="col-7">
                        <textarea id="txtEditQuestion" name="questionContent" cols="20" rows="8" class="form-control"></textarea>
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