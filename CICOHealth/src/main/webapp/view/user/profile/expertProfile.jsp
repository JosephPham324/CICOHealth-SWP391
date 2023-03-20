<%-- Document : expertProfile Created on : Mar 14, 2023, 7:34:43 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/profile/expert.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>

        <title>Expert Profile</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <div class="profile" data-allowUpdate=${allowUpdate}>
            <div class="container">
                <div class="profile-header">
                    <div class="profile-picture">
                        <div class="img-wrapper">
                            <img src="${expertProfile.profilePicture}" alt="Profile Picture" />
                        </div>
                        <c:if test="${allowUpdate}">
                            <button class="button" id="btn-update-pfp">Update Photo</button>
                        </c:if>
                    </div>
                    <div class="profile-info">
                        <h2 class="profile-name" id="username">
                            ${user.firstName.concat(' ').concat(user.lastName)}
                        </h2>
                        <div class="form-group">
                            <label for="expert-bio">Bio</label>
                            <textarea name="expert-bio" id="expert-bio" cols="50" rows="10"
                                      style="resize: none" ${allowUpdate ? "" : "disabled"
                                                             }>${expertProfile.bio}</textarea>
                        </div>
                    </div>
                    <c:if test="${allowUpdate}">
                        <div class="profile-actions">
                            <button class="button" id="btn-update-profile">Save Changes</button>
                        </div>
                    </c:if>
                </div>

                <!-- ===================================================-->

                <div class="certs">
                    <h2>Certifications</h2>
                    <ul class="cert-list">
                        <c:forEach var="certification" items="${certifications}">
                            <li class="cert">
                                <div class="cert-wrapper">
                                    <input type="hidden" name="cert-action" value="update" />
                                    <input type="hidden" name="cert-id" value="${certification.certID}" />
                                    <div class="cert-photo">
                                        <img src="${certification.certPhoto}"
                                             alt="Certificate ${certification.certName} Photo" />
                                    </div>

                                    <div class="cert-info">
                                        <h3 class="cert-name">${certification.certName}</h3>
                                        <p class="cert-issuer"><span>Issuer: </span>
                                            ${certification.certIssuer}</p>
                                        <p class="cert-date"><span>Issue Date:
                                            </span>${certification.certDate}</p>
                                    </div>
                                    <c:if test="${allowUpdate}">
                                        <div class="cert-actions">
                                            <button class="button" onclick="fillUpdateCertForm(this)">
                                                Update
                                            </button>
                                            <button class="button delete-button">Delete</button>
                                        </div>
                                    </c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <c:if test="${allowUpdate}">
                        <button class="button" id="btn-add-cert">Add</button>
                        <div class="frm-collapse">
                            <form id="frm-add-cert" onsubmit="event.preventDefault();addCert();">
                                <div class="form-group">
                                    <label for="new-cert-name">cert Name</label>
                                    <input type="text" name="cert-name" id="new-cert-name" required />
                                </div>
                                <div class="form-group">
                                    <label for="new-cert-date">cert Date</label>
                                    <input type="date" name="cert-name" id="new-cert-date" required />
                                </div>
                                <div class="form-group">
                                    <label for="new-cert-issuer">cert Issuer</label>
                                    <input type="text" name="cert-issuer" id="new-cert-issuer" required />
                                </div>
                                <div class="form-group">
                                    <label for="new-cert-image">cert Image</label>
                                    <img src="https://res.cloudinary.com/cicohealth/image/upload/v1678676494/u0gewgadkqdwgu6fnuv1.png"
                                         alt="Certification photo" id="new-cert-image" width="300px"
                                         height="200px" />
                                    <a class="button" id="btn-upload-cert-img">Upload image</a>
                                </div>
                                <input type="submit" value="Submit" />
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
            <c:if test="${allowUpdate}">
                <div class="pop-up" id="cert-update">
                    <div class="overlay"></div>
                    <div class="pop-up-content">
                        <form id="frm-update-cert" onsubmit="event.preventDefault();updateCert();">
                            <input type="hidden" name="update-cert-id" id="update-cert-id">
                            <div class="form-group">
                                <label for="update-cert-name">cert Name</label>
                                <input type="text" name="cert-name" id="update-cert-name" required />
                            </div>
                            <div class="form-group">
                                <label for="update-cert-date">cert Date</label>
                                <input type="date" name="cert-name" id="update-cert-date" required />
                            </div>
                            <div class="form-group">
                                <label for="update-cert-issuer">cert Issuer</label>
                                <input type="text" name="cert-issuer" id="update-cert-issuer" required />
                            </div>
                            <div class="form-group">
                                <label for="update-cert-image">cert Image</label>
                                <img src="" alt="Certification photo" id="update-cert-image" width="300px"
                                     height="200px" />
                                <a class="button" id="btn-upload-cert-img">Upload image</a>
                            </div>
                            <input type="submit" value="Submit" />
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/profile/expertProfile.js"></script>
    </body>
</html>