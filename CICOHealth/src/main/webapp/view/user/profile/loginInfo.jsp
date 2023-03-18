<%@page import="bean.User" %>
<%@page import="bean.Login" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="originPass" value = "${sessionScope.originPass}"/>

<c:set var="l" value="${loginInfo}" scope="request" />
<!DOCTYPE html>
<html>

    <head>

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
              rel="stylesheet" />
        <!-- <link rel="stylesheet" href="/CICOHealth/assets/css/loginInfo.css" /> -->
        <!-- <link rel="stylesheet" href="/CICOHealth/assets/css/healthInfo.css" /> -->
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/loginInfo.css">

        <title>Login Information</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <div class="page-wrapper chiller-theme">
            <%@include file="sidebarProfile.jsp" %>
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <form action="ProfileController" method="post">
                                <div class="card">
                                    <div class="card-header">
                                        Login Information ${originPass}
                                    </div> 
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="firstName">Username</label>
                                            <input type="text" name="username" value="${l.username}"
                                                   class="form-control">

                                        </div>
                                        <div class="form-group">
                                            <label for="firstName">Password</label>
                                            <input type="password" name="password"
                                                   value="${l.passwordHash}" class="form-control"
                                                   id="id_password">
                                            <i class="far fa-eye" id="togglePassword"
                                               onclick="eyeToggle()"
                                               data-passwordHash="${l.passwordHash}"></i>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="_method" value="put"
                                                   style="display: none" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="userID" value="${l.userID}"
                                                   style="display: none" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="googleID" value="${l.googleID}"
                                                   style="display: none" class="form-control">
                                        </div>
                                    </div>
                                    <div class="card-footer text-right">
                                        <input type="hidden" value="PUT" name="_method">
                                        <a name="btnUpdate" id="btnUpdate" class="btn btnUpdate">Save</a>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </main>

            <div class="pop-up login-info-pop-up" id="login-info-pop-up">
                <div class="login-info-overlay overlay" id="overlay"></div>
                <div class="pop-up-content login-info-pop-up-content">
                    <h2 class="txt-title-pop-up">Comfirm Password</h2>

                    <div class="form-group row">
                        <div class="offset-1 col-4">
                            <label for="firstName">Password</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-1 col-10">
                            <input type="text" name="txtPassword" id="txtPassword1"
                                   class="form-control">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="offset-1 col-4">
                            <label for="firstName">Confirm Password</label>
                        </div>
                    </div>
                    <div class="form-group row">

                        <div class="offset-1 col-10">

                            <input type="text" name="txtComfirmPassword" id="txtPassword2"
                                   class="form-control">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="offset-8 col-2">
                            <button name="btn-submit" type="submit" class="btn"
                                    id="btn-submit" onclick="confirm(${originPass})">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/view/general/footer.jsp" %>

        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
        <script src="/CICOHealth/assets/scripts/loginInfo.js"></script>
        <script>
                                        const confirmButton = document.getElementById('btnUpdate');

                                        confirmButton.addEventListener('click', () => {
                                            displayPopUp("login-info-pop-up");
                                        });

                                        function confirm(originPass) {
                                            let pass1 = document.getElementById("txtPassword1").value;
                                            let pass2 = document.getElementById("txtPassword2").value;
                                            alert(pass1 + pass2)
                                            if (pass1 === pass2) {
                                                if (pass1 === originPass) {
                                                    var popup = document.getElementById("login-info-pop-up");
                                                    popup.classList.remove("active");
                                                }
                                            }
                                        }
        </script>

    </body>

</html>