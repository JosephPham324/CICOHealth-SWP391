//--------------------Cloudinary--------------------
function openUploadWidget() {
  return new Promise((resolve, reject) => {
    const myWidget = cloudinary.createUploadWidget(
      {
        cloudName: "cicohealth",
        uploadPreset: "liyqe8q0",
        max_files: 1,
      },
      (error, result) => {
        if (error) {
          reject(error);
        } else if (result && result.event === "success") {
          resolve(result.info);
        }
      }
    );
    myWidget.open();
  });
}

async function handleUpload() {
  try {
    const uploadedImageInfo = await openUploadWidget();
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
  console.log(certName);
  console.log(certDate);
  console.log(certIssuer);
  console.log(certImg);
  let html = `
  <div class="cert-wrapper">
    <div class="cert-photo">
      <img src="${certImg}" alt="Certificate ${certName} Photo" />
      <button class="btn-update-cert button">Update</button>
    </div>
    <div class="cert-info">
      <h3 class="cert-name">${certName}</h3>
      <p class="cert-issuer"><span>Issuer: </span> ${certIssuer}</p>
      <p class="cert-date"><span>Issue Date: </span>${certDate}</p>
    </div>
    <div class="cert-actions">
      <button class="delete-button">Delete</button>
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
}

//--------------------PopUp--------------------
function openCertificationDetail() {
  displayPopUp("cert-detail");
}
$("document").ready(function () {
  //--------------------Variables, resources, references--------------------
  let pfpImageLink = "";
  const btnUploadPfp = document.getElementById("btn-update-pfp");
  const formAddCert = document.getElementById("frm-add-cert");
  const formUpdateCert = document.getElementById("frm-update-cert");
  const btnAddCert = document.getElementById("btn-add-cert");
  const btnUploadCertImg = document.getElementById("btn-upload-cert-img");
  const btnSaveChanges = document.getElementById("btn-update-profile");
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
    let info = await openUploadWidget();
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
    let info = await handleUpload();
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
      let certName = cert.querySelector(".cert-name").innerHTML;
      let certDate = cert.querySelector(".cert-date").innerHTML;
      let certIssuer = cert.querySelector(".cert-issuer").innerHTML;
      let certImg = cert.querySelector(".cert-photo img").src;
      certList.push({
        name: certName,
        date: certDate,
        issuer: certIssuer,
        img: certImg,
      });
    });
    //Put the data into a JSON
    let data = {
      username: username,
      bio: bio,
      pfp: pfp,
      certs: certList,
    };
    //Log JSON
    console.log(data);
  });
});
