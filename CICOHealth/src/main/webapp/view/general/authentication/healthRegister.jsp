<%-- Document : health-register Created on : Feb 9, 2023, 7:59:42 AM Author :
Pham Nhat Quang CE170036 (FPTU CANTHO) --%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/loginscss.css" />
        
        <title>Register</title>
    </head>
    <body>

        <div class="container">
            <div class="login-left">
                <div class="login-header register-header">
                    <h1>Welcome to Our Application</h1>
                    <p>Please register to login into the platform</p>
                </div>

                <form action="register" method="post" class="login-form">
                        <%@include file="../../user/formHealthInfor.jsp" %>
                        <input type="hidden" name="healthReg" value="false" id="register-health" />
                        <input type="hidden" name="txtUsername" value="${param.txtUsername}" />
                        <input type="hidden" name="txtPassword" value="${param.txtPassword}" />
                        <input type="hidden" name="txtFirstName" value="${param.txtFirstName}" />
                        <input type="hidden" name="txtLastName" value="${param.txtLastName}" />
                        <input type="hidden" name="txtEmail" value="${param.txtEmail}" />
                        <input type="hidden" name="txtPhone" value="${param.txtPhone}" />
                        <input type="hidden" name="googleID" value="${param.googleID}" />
            
                        <div>
                            <div>
                                <button name="submit" type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                            </div>
                        </div>
                  
                    
                </form>
            </div>

            <div class="login-right">
                <img src="/CICOHealth/assets/img/height_weight_check.png">
            </div>

            
        </div>
        
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
