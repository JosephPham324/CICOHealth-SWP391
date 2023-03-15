//--------------------Cloudinary--------------------
function openUploadWidget(triggerElement) {
  return new Promise((resolve, reject) => {
    const myWidget = cloudinary.createUploadWidget(
      {
        cloudName: "cicohealth",
        uploadPreset: "liyqe8q0",
        max_files: 1,
        cropping:true,
        resourceType:"image",
      },
      (error, result) => {
        //Enable the button
        triggerElement.disabled = false;
        if (error) {
          document.body.style.overflow = "auto";
          //Destroy the widget
          myWidget.destroy();
          reject(error);
        } else if (result && result.event === "success") {
          //Destroy the widget
          document.body.style.overflow = "auto";
          myWidget.destroy();
          resolve(result.info);
        } else if (result && result.event === "close") {
          //Destroy the widget
          myWidget.destroy();
        }
      }
    );
    triggerElement.disabled = true;
    myWidget.open();
  });
}

async function handleUpload(triggerElement) {
  try {
    console.log(triggerElement);
    const uploadedImageInfo = await openUploadWidget(triggerElement);
    console.log(uploadedImageInfo);
    //Check if rejected
    if (uploadedImageInfo == undefined) {
      console.log("Rejected");
      return;
    }
    return uploadedImageInfo;
  } catch (error) {
    console.error("Error uploading image:", error);
  }
}
//--------------------Cloudinary--------------------

//--------------------Functionalities--------------------
function addCert() {
  let certName = document.querySelector("#new-cert-name").value;
  let certDate = document.querySelector("#new-cert-date").value;
  let certIssuer = document.querySelector("#new-cert-issuer").value;
  let certImg = document.querySelector("#new-cert-image").src;
  //Create the HTML for the new certification
  let html = `
  <div class="cert-wrapper">
    <input type="hidden" name="cert-id" id="cert-id" value = "">
    <div class="cert-photo">
      <img src="${certImg}" alt="Certificate ${certName} Photo" />
      <button class="btn-update-cert button" onclick="updateCertPhoto(this);">Update</button>
    </div>
    <div class="cert-info">
      <h3 class="cert-name">${certName}</h3>
      <p class="cert-issuer"><span>Issuer: </span> ${certIssuer}</p>
      <p class="cert-date"><span>Issue Date: </span>${certDate}</p>
    </div>
    <div class="cert-actions">
      <button class="button" onclick = "fillUpdateCertForm(this)">Update</button>
      <button class="button">Delete</button>
    </div>
  </div>
  `;
  let listItem = document.createElement("li");
  listItem.classList.add("cert");
  listItem.innerHTML = html;
  document.querySelector(".cert-list").appendChild(listItem);
  //Clear the form
  document.querySelector("#new-cert-name").value = "";
  document.querySelector("#new-cert-date").value = "";
  document.querySelector("#new-cert-issuer").value = "";
  document.querySelector("#new-cert-image").src = "";

  btnAddCert.click();
}

async function updateCertPhoto(btnElement) {
  let imgElement = btnElement.parentElement.querySelector("img");
  let newsrc = await handleUpload(btnElement);
  imgElement.src = newsrc.secure_url;
}

function fillUpdateCertForm(btnElement) {
  let cert = btnElement.parentElement.parentElement;
  certToUpdate = cert;
  cert.id = "cert-to-update";
  console.log(cert);
  let certName = document.querySelector("#cert-to-update .cert-name").innerHTML;
  let certDate = document
    .querySelector("#cert-to-update .cert-date")
    .textContent.substring(12);
  console.log(certDate);
  let certIssuer = document
    .querySelector("#cert-to-update .cert-issuer")
    .textContent.substring(9);
  let certImg = document.querySelector("#cert-to-update .cert-photo img").src;

  document.querySelector("#update-cert-name").value = certName;
  document.querySelector("#update-cert-date").value = certDate;
  document.querySelector("#update-cert-issuer").value = certIssuer;
  document.querySelector("#update-cert-image").src = certImg;

  displayPopUp("cert-update");
  cert.id = "";
}

function updateCert() {
  let certName = document.querySelector("#update-cert-name").value;
  let certDate = document.querySelector("#update-cert-date").value;
  let certIssuer = document.querySelector("#update-cert-issuer").value;
  let certImg = document.querySelector("#update-cert-image").src;
  console.log(certToUpdate);
  if (certToUpdate != null) {
    certToUpdate.innerHTML = `
  <input type="hidden" name="cert-id" id="cert-id" value = "">
    <div class="cert-photo">
      <img src="${certImg}" alt="Certificate ${certName} Photo" />
      <button class="btn-update-cert button" onclick="updateCertPhoto(this);">Update</button>
    </div>
    <div class="cert-info">
      <h3 class="cert-name">${certName}</h3>
      <p class="cert-issuer"><span>Issuer: </span> ${certIssuer}</p>
      <p class="cert-date"><span>Issue Date: </span>${certDate}</p>
    </div>
    <div class="cert-actions">
      <button class="button" onclick = "fillUpdateCertForm(this)">Update</button>
      <button class="button">Delete</button>
    </div>
  `;
  }
  certToUpdate = null;
  document.querySelector("#cert-update .overlay").click();
}

//--------------------PopUp--------------------
function openCertificationDetail() {
  displayPopUp("cert-detail");
}
//--------------------Variables, resources, references--------------------
let pfpImageLink = "";
const btnUploadPfp = document.getElementById("btn-update-pfp");
const formAddCert = document.getElementById("frm-add-cert");
const formUpdateCert = document.getElementById("frm-update-cert");
const btnAddCert = document.getElementById("btn-add-cert");
const btnUploadCertImg = document.getElementById("btn-upload-cert-img");
const btnSaveChanges = document.getElementById("btn-update-profile");
let certToUpdate = null;
//--------------------Variables, resources, references--------------------
//Log all the elements
console.log(btnUploadPfp);
console.log(formAddCert);
//   console.log(formUpdateCert);
console.log(btnAddCert);
console.log(btnUploadCertImg);
//--------------------Main body-------------------------------------------
btnUploadPfp.addEventListener("click", async () => {
  //Close handler to update the image
  let info = await handleUpload(btnUploadPfp);
  //Check if rejected
  if (info == undefined) {
    return;
  }
  pfpImageLink = info.secure_url;
  //Update the image
  let img = document.querySelector(".profile-picture img");
  img.src = pfpImageLink;
});

//Display the form to add a new certification
btnAddCert.addEventListener("click", () => {
  let collapse = document.getElementsByClassName("collapse")[0];
  collapse.classList.toggle("show");
  if (collapse.classList.contains("show")) {
    btnAddCert.innerHTML = "Cancel";
  } else {
    btnAddCert.innerHTML = "Add";
  }
});

//Upload the image to cloudinary using the widget
//and get the link to the image
btnUploadCertImg.addEventListener("click", async () => {
  let info = await handleUpload(btnUploadCertImg);
  document.querySelector("#new-cert-image").src = info.secure_url;
});

let crtDelete = document.querySelectorAll(".cert-actions .delete-button");
crtDelete.forEach((btn) => {
  btn.addEventListener("click", () => {
    let cert = btn.parentElement.parentElement.parentElement;
    cert.remove();
  });
});
btnSaveChanges.addEventListener("click", () => {
  //Collect all information
  //Username
  let username = document.querySelector("#username").innerHTML;
  //Bio
  let bio = document.querySelector("#expert-bio").value;
  //Profile image source
  let pfp = document.querySelector(".profile-picture img").src;
  //Certifications
  let certs = document.querySelectorAll(".cert");
  let certList = [];
  certs.forEach((cert) => {
    let certID = cert.querySelector("#cert-id").value;
    let certName = cert.querySelector(".cert-name").textContent;
    //Cut from end of this pattern "Issue Date: "
    let certDate = cert.querySelector(".cert-date").textContent.substring(12);
    //Cut from end of this pattern "Issuer: "
    let certIssuer = cert
      .querySelector(".cert-issuer")
      .textContent.substring(9);
    let certImg = cert.querySelector(".cert-photo img").src;
    certList.push({
      certID: certID,
      certName: certName,
      certDate: certDate,
      certIssuer: certIssuer,
      certPhoto: certImg,
    });
  });
  let userId = getRequestParameter("userid");
  //Put the data into a JSON
  let data = {
    userId: userId,
    expertProfile: {
      bio: bio,
      profilePicture: pfp,
    },
    certificationCollection: certList,
  };
  //Log JSON
  console.log(data);
});
