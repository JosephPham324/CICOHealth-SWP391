function getAccountCredentials() {
  console.log("getAccountCredentials");
  let firstName = $("#txtFirstName").val();
  let lastName = $("#txtLastName").val();
  let type = $("#type option:selected").val();
  $.get(
    "/CICOHealth/admin/user-management/create-username?firstname=" +
      firstName +
      "&lastname=" +
      lastName +
      "&type=" +
      type,
    function (data, status) {
      //Split data by space, and stitch together
      let username = data.split(" ").join("");

      $("#txtUsername").val(username);
      $("#txtPassword").val(username);
    }
  );
}

$(document).ready(function () {
  //Get add button
  let addButton = document.getElementById("add-button");
  //Add click event listener to add button
  let add_clicked = false;
  addButton.addEventListener("click", function () {
    if (add_clicked == false) {
      let html_pop_up_addButton = `
    <div class="overlay"></div>
    <div class="pop-up-content">
        <form action="/CICOHealth/admin/user-management" method="post" id = "register-form" style="
    width: 450px;">
            <div class="form-group row">
                <div class="offset-4 col-8">
                <h2> Add Account</h2>
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-4 col-form-label">First name</label>
                <div class="col-8">
                <input
                        required="required"
                        id="txtFirstName"
                        name="txtFirstName"
                        placeholder="Enter your first name"
                        type="text"
                        class="form-control"
                        />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-4 col-form-label">Last name</label>
                <div class="col-8">
               <input
                        required="required"
                        id="txtLastName"
                        name="txtLastName"
                        placeholder="Enter your last name"
                        type="text"
                        class="form-control"
                        />
                </div>
            </div>
        
            <div class="form-group row">
                <label class="col-4 col-form-label">Type</label>
                <div class="col-8">
                <select id="type" name="type" class="form-control">
                    <option value="ME">Member</option>
                        <option value="FE">Fitness Expert</option>
                        <option value="AD">Admin</option>
                </select>
                </div>
            </div>
        
            <div class="form-group row">
                <label for="txtUsername" class="col-4 col-form-label">Username</label>
                <div class="col-8">
                    <input
                        required="required"
                        id="txtUsername"
                        name="txtUsername"
                        placeholder="Enter username"
                        type="text"
                        class="form-control"
                        readonly="true"
                        />
                </div>
            </div>
            <div class="form-group row" id="password-field">
                    <label for="txtPassword" class="col-4 col-form-label">Password</label>
                    <div class="col-8">
                        <input
                            required="required"
                            id="txtPassword"
                            name="txtPassword"
                            placeholder="Enter password"
                            type="password"
                            class="form-control"
                            aria-describedby="txtPasswordHelpBlock"
                            readonly="true"
                            />
                        <span id="txtPasswordHelpBlock" class="form-text text-muted"></span>
                    </div>
                </div>
            <div class="form-group row">
                <div class="offset-4 col-8">
                <button name="btnAdd" type="submit" class="btn btn-primary">Add</button>
                </div>
            </div>
        </form>
    </div>
       
        `;
      let pop_up_element = document.createElement("div");
      pop_up_element.id = "add-account-popup";
      pop_up_element.classList.add("pop-up");
      pop_up_element.innerHTML = html_pop_up_addButton;
      document.body.appendChild(pop_up_element);
      displayPopUp("add-account-popup");
      add_clicked = true;
      console.log("add clicked");
      document
        .getElementById("txtFirstName")
        .addEventListener("change", getAccountCredentials);
      document
        .getElementById("txtLastName")
        .addEventListener("change", getAccountCredentials);
      document
        .getElementById("type")
        .addEventListener("change", getAccountCredentials);
    }
    displayPopUp("add-account-popup");
  });
  console.log($("#users-table"))
  $('#users-table').DataTable();
});
