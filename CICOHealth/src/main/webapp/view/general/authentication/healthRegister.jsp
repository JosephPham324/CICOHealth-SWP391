<%-- Document : health-register Created on : Feb 9, 2023, 7:59:42 AM Author :
Pham Nhat Quang CE170036 (FPTU CANTHO) --%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
        </style>
        <title>Register</title>
    </head>
    <body>
        <form action="register" method="post">
            <%@include file="../../user/formHealthInfor.jsp" %>
            <input type="hidden" name="healthReg" value="false" id="register-health" />
            <input type="hidden" name="txtUsername" value="${param.txtUsername}" />
            <input type="hidden" name="txtPassword" value="${param.txtPassword}" />
            <input type="hidden" name="txtFirstName" value="${param.txtFirstName}" />
            <input type="hidden" name="txtLastName" value="${param.txtLastName}" />
            <input type="hidden" name="txtEmail" value="${param.txtEmail}" />
            <input type="hidden" name="txtPhone" value="${param.txtPhone}" />
            <input type="hidden" name="googleID" value="${param.googleID}" />

            <div class="form-group row">
                <div class="offset-4 col-8">
                    <button name="submit" type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </div>
            </div>
        </form>
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
