
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
                <select id="type" name="type" class="form-control" onchange="getValue(this)">
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
  }
  displayPopUp("add-account-popup");
  });
  
  function  getValue(sel) {

                if (sel.value === 'ME' || sel.value === 'FE' || sel.value === 'AD') {
                    var firstName = $("#txtFirstName").val();
                    var lastName = $("#txtLastName").val();
                    var type = $("#type option:selected").val();
                    var result = validateUser(firstName, lastName, type);
                }
            }

            function validateUser(firstName, lastname, type) {
                $.get("/CICOHealth/admin/user-management/create-username?firstname=" + firstName + "&lastname=" + lastname + "&type=" + type, function (data, status) {
                    console.log(data);
                    $("#txtUsername").val(data);
                    $("#txtPassword").val(data);

                });
            }