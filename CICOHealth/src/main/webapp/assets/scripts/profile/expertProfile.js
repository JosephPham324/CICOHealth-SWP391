//--------------------Cloudinary--------------------
function openUploadWidget() {
  return new Promise((resolve, reject) => {
    const myWidget = cloudinary.createUploadWidget(
      {
        cloudName: "cicohealth",
        uploadPreset: "liyqe8q0",
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

//--------------------PopUp--------------------
function openCertificationDetail() {
  displayPopUp("certification-detail");
}
$("document").ready(function () {
  //--------------------Variables, resources, references--------------------
  let pfpImageLink = "";
  const btnUploadPfp = document.getElementById("btn-update-pfp");
  const formAddCert = document.getElementById("frm-add-cert");
//   const formUpdateCert = document.getElementById("form-update-cert");
  const btnAddCert = document.getElementById("btn-add-cert");
  const btnUploadCertImg = document.getElementById("btn-upload-cert-img");
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
    let info = await handleUpload();
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
  btnUploadCertImg.addEventListener("click", () => {
    let info = handleUpload();
    console.log(info);
  });
});
