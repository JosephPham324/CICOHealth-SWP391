/**
 * Sends a request to the Nutritionix API to get the nutrition information for the given food(s)
 * @param {string} query - The food(s) to search for
 * */
function sendRequest(query) {
  let request = new XMLHttpRequest();
  let url = "https://trackapi.nutritionix.com/v2/natural/nutrients"; //The URL to send the request to
  let body = {
    query: query, //The food(s) to search for
  };
  let applicationID = "9a0d8da3"; //The application ID
  let APIKey = "32c2215ddef1b8d9b0e9e9ea759814a7"; //The API key

  request.open("POST", url, true); //Open the request
  //Set the request headers
  request.setRequestHeader("Content-Type", "application/json");
  request.setRequestHeader("x-app-id", applicationID);
  request.setRequestHeader("x-app-key", APIKey);
  //Set the request callback
  request.onreadystatechange = function () {
    if (request.readyState === XMLHttpRequest.DONE && request.status === 200) {
      let response = request.responseText; //Get the response
      response = JSON.parse(response); //Parse the response into JSON
      let foods = response.foods; //Get the foods array
      foods = removeDuplicate(foods); //Filter out duplicate foods
      dislpayFoods(foods); //Display the foods
      addSearchResultEventListener(); //Add the search result event listener
      showSelected(selectedFoods);
    }
  };
  request.send(JSON.stringify(body)); //Send the request
}

/**
 * Filter out duplicate foods in foods array
 * @param {Array} foods - The foods array
 * */
function removeDuplicate(foods) {
  let filteredFoods = [];
  for (let i = 0; i < foods.length; i++) {
    let food = foods[i];
    let foodName = food.food_name;
    //Check if food already exists in filteredFoods array
    let foodExists =
      filteredFoods.find((food) => food.food_name === foodName) !== undefined;
    if (!foodExists) {
      filteredFoods.push(food);
    }
  }
  return filteredFoods;
}
/**
 * Displays the foods elements
 * @param {Array} foods - The foods to display
 */
function dislpayFoods(foods) {
  let searchResults = document.getElementById("search-results");
  searchResults.innerHTML = "";
  //Iterate through foods
  for (let i = 0; i < foods.length; i++) {
    //Get food data as JSON
    let food = foods[i];
    //Create food data object
    let foodData = {
      foodName: food.food_name,
      servingWeight: food.serving_weight_grams,
      calories: food.nf_calories,
      protein: food.nf_protein,
      fat: food.nf_total_fat,
      carbs: food.nf_total_carbohydrate,
      photo: food.photo.highres,
      actualWeight: food.serving_weight_grams,
    };
    displayFoodItem(searchResults, foodData); //Display the food item
  }
}
/**
 * Adds a search result element to the search results
 * @param {HTMLElement} searchResults - The search results element
 * @param {Object} food - The food data
 * */
function displayFoodItem(searchResults, food) {
  let html = `
    <div
      class="search-result"
      data-food='${JSON.stringify(food)}'
    >
      <h3 class="search-result-name">${food.foodName}</h3>
      <div class="search-result-content">
        <div class="search-result-image">
          <img
            src="${food.photo}"
            alt="${food.foodName} photo"
          />
        </div>
        <div class="search-result-description">
          <span class="search-result-quantity">Serving: ${
            food.servingWeight
          }(g)</span>
          <span class="search-result-calories">Kcal: ${food.calories}</span>
          <span class="search-result-protein">Protein: ${food.protein}</span>
          <span class="search-result-fat">Fat: ${food.fat}</span>
          <span class="search-result-carbs">Carbs: ${food.carbs}</span>
          <button class="search-result-button">Add</button>
        </div>
      </div>
    </div>
    `;
  searchResults.innerHTML += html;
}
// Array to store selected foods
let selectedFoods = [];

/**
 * Add food to selected foods array
 *
 * @param {Object} food - The food object to be added
 * @throws {Error} If the food object is already present in the selected foods array
 */
function addFood(food) {
  // Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === food.foodName) {
      throw new Error("Food already in selected foods");
    }
  }
  selectedFoods.push(food);
}

/**
 * Remove food from selected foods array
 *
 * @param {Object} food - The food object to be removed
 * @throws {Error} If the food object is not present in the selected foods array
 */
function removeFood(food) {
  // Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === food.foodName) {
      selectedFoods.splice(i, 1);
      return;
    }
  }
  throw new Error("Food not in selected foods");
}
/**
 * Remove food from selected foods array by foodName
 *
 * @param {string} foodName - The name of the food to be removed
 * @throws {Error} If the food with the specified name is not present in the selected foods array
 */
function removeFoodByName(foodName) {
  // Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === foodName) {
      selectedFoods.splice(i, 1);
      return;
    }
  }
  throw new Error("Food not in selected foods");
}

/**
 * Toggle food in selected foods array
 *
 * @param {Object} food - The food object to be toggled
 * @returns {boolean} True if the food was added to the selected foods array, false if it was removed
 */
function toggleFood(food) {
  // Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === food.foodName) {
      removeFood(food);
      return false;
    }
  }
  addFood(food);
  return true;
}
/**
 * Add click event listener to search results
 * Toggle selected status of search result clicked, and add/remove food from selectedFoods
 */
function addSearchResultEventListener() {
  // Get the search results container element
  let searchResults = document.getElementById("search-results");
  // Iterate through each search result element
  for (let i = 0; i < searchResults.children.length; i++) {
    let searchResult = searchResults.children[i];
    // Add event listener to each search result element
    searchResult.addEventListener("click", function () {
      let food = JSON.parse(this.dataset.food);
      // Toggle the food's selected status and update the search result's UI accordingly
      if (toggleFood(food) == true) {
        this.classList.add("selected");
        changeButtonText(this, "add");
      } else {
        this.classList.remove("selected");
        changeButtonText(this, "remove");
      }
      // Update the food cart button UI
      updateFoodCartButton();
    });
  }
}
/**
 * Change the text of the button in search result
 * @param {Element} searchResult - The search result element
 * @param {string} state - The new state of the button ("add" or "remove")
 */
function changeButtonText(searchResult, state) {
  // Get the button element within the search result element
  let button = searchResult.children[1].children[1].children[5];
  // Change the button text based on the given state
  switch (state) {
    case "add":
      button.innerText = "Remove";
      button.style.backgroundColor = "red";
      break;
    case "remove":
      button.innerText = "Add";
      button.style.backgroundColor = "";
      break;
    default:
      break;
  }
}
/**
 * Add selected class to search-result elements that contain food in selectedFoods
 *
 * @param {Array} selectedFoods - The array of selected foods
 *
 */
function showSelected(selectedFoods) {
  let searchResults = document.getElementById("search-results");
  for (let i = 0; i < searchResults.children.length; i++) {
    let searchResult = searchResults.children[i];
    if (
      selectedFoods.find(
        (food) => food.foodName === searchResult.children[0].innerText //If a selected food has name equal to search result name
      )
    ) {
      searchResult.classList.add("selected");
      changeButtonText(searchResult, "add");
      updateFoodCartButton();
    } else {
      searchResult.classList.remove("selected");
      changeButtonText(searchResult, "remove");
      updateFoodCartButton();
    }
  }
}
/**
 * Add selected class to search-result elements that contain food in selectedFoods
 */
function showSelected() {
  let searchResults = document.getElementById("search-results");
  //Iterate through search result elements
  for (let i = 0; i < searchResults.children.length; i++) {
    let searchResult = searchResults.children[i];
    //Check if the food is in the selectedFoods array
    if (
      selectedFoods.find(
        (food) => food.foodName === searchResult.children[0].innerText //If a selected food has name equal to search result name
      )
    ) {
      //Add "selected" class to search-result element
      searchResult.classList.add("selected");
      //Change the text of the button in search-result element to "Remove"
      changeButtonText(searchResult, "add");
      //Update the number of selected foods in food cart button
      updateFoodCartButton();
    } else {
      //Remove "selected" class from search-result element
      searchResult.classList.remove("selected");
      //Change the text of the button in search-result element to "Add"
      changeButtonText(searchResult, "remove");
      //Update the number of selected foods in food cart button
      updateFoodCartButton();
    }
  }
}

/**
 * Update the number of selected foods in food cart button
 */
function updateFoodCartButton() {
  let foodCartButton = document.getElementById("selected-number");
  //Update the text content of food cart button to display the number of selected foods
  foodCartButton.innerText = `${selectedFoods.length}`;
}

addSearchResultEventListener();

//Send request of some common foods, separated by new line

//Food cart element
let mealCart = document.getElementById("food-cart");
//Display pop-ups
function displayPopUp(id) {
  let popUp = document.getElementById(id);
  let overlay = document.querySelector(`#${id} .overlay`);
  popUp.classList.add("active");
  overlay.addEventListener("click", function (e) {
    popUp.classList.remove("active");
  });
}

//Add event listener to food cart button
document.getElementById("food-cart").addEventListener("click", displayMealForm);

/**

Display meal form pop-up
The function displays a pop-up that allows the user to create a meal using the selected foods
*/
function displayMealForm() {
  // Display meal form pop-up
  displayPopUp("meal-pop-up");
  // Clear meal form
  let mealForm = document.getElementById("meal-form");
  mealForm.innerHTML = "";
  let tableHTML = `
  <table id="table_id" class="display">
      <thead>
          <tr>
              <th>Name</th>
              <th>Calorie(kcal)</th>
              <th>Protein(g)</th>
              <th>Fat(g)</th>
              <th>Carbs(g)</th>
              <th>Serving(g)</th>
              <th>Actual(g)</th>
              <th>Remove</th>
          </tr>
      </thead>
      <tbody>
  `;
  // Iterate through selected foods and add them to the meal form
  selectedFoods.forEach((food) => {
    //Add rows to the table
    let rowHTML = `
    <tr>
      <td>${food.foodName}</td>
      <td>${(food.calories * (food.actualWeight / food.servingWeight)).toFixed(0)}</td>
      <td>${(food.protein * (food.actualWeight / food.servingWeight)).toFixed(1)}</td>
      <td>${(food.fat * (food.actualWeight / food.servingWeight)).toFixed(1)}</td>
      <td>${(food.carbs * (food.actualWeight / food.servingWeight)).toFixed(1)}</td>
      <td>${food.servingWeight}</td>
      <td>
        <input id="weight-${food.foodName}" 
        name="weight-${food.foodName}" 
        type="number" class="form-control"
        required="required" 
        value="${food.actualWeight}" 
        onblur="updateFoodItem('${food.foodName}', this.value)"
        />
      </td>
      <td>
        <button id="remove-${food.foodName}"
        class="btn btn-danger"
        onclick="removeFoodByName('${food.foodName}');showSelected();displayMealForm();"
        >Remove</button>
      </td>
    </tr>
    `;
    //Add row to the table
    tableHTML += rowHTML;
  });

  // Sum up the nutrition information of the selected foods
  let mealSum = calculateMealSum(selectedFoods);
  let rowMealSumHTML = `
  <tr class="sum">
    <td>Sum</td>
    <td>${mealSum[0].toFixed(0)}</td>
    <td>${mealSum[1].toFixed(1)}</td>
    <td>${mealSum[2].toFixed(1)}</td>
    <td>${mealSum[3].toFixed(1)}</td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  `;
  //Add row to the table
  tableHTML += rowMealSumHTML;
  // Close table
  tableHTML += `
      </tbody>
  </table>
  `;
  //Add table to the meal form
  mealForm.innerHTML += tableHTML;

  // Add meal name input
  let htmlMealName = `
  <div class="form-group row">
    <label for="meal-name" class="col-4 col-form-label">Meal Name</label> 
    <div class="col-8">
      <input id="meal-name" name="meal-name" placeholder="Enter meal name" type="text" class="form-control"
      required="required"
      value="${mealName}"
      oninput='mealName = this.value;';
      >
    </div>
  </div> 
    `;
  mealForm.innerHTML += htmlMealName;

  //Add meal log note
  let htmlMealNote = `
  <div class="form-group row">
    <label for="meal-note" class="col-4 col-form-label">Meal Note</label>
    <div class="col-8">
      <textarea id="meal-note" name="meal-note" cols="40" rows="5" class="form-control"
      value="${logNote}"
      oninput='logNote = this.value;'></textarea>
    </div>
  </div>
  `;
  mealForm.innerHTML += htmlMealNote;

  //Add submit button to meal form
  mealForm.innerHTML += `
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-submit">Submit</button>
    </div>
  </div>
  `;
}

/**
 * Calculate the total calories, protein, fat, and carbs of the selected foods
 *
 * @param {Array} selectedFoods - An array of selected foods
 * @returns {Array} - An array of the total calories, protein, fat, and carbs of the selected foods
 */
function calculateMealSum(selectedFoods) {
  let totalCalories = 0;
  let totalProtein = 0;
  let totalFat = 0;
  let totalCarbs = 0;
  selectedFoods.forEach((food) => {
    totalCalories += food.calories * (food.actualWeight / food.servingWeight);
    totalProtein += food.protein * (food.actualWeight / food.servingWeight);
    totalFat += food.fat * (food.actualWeight / food.servingWeight);
    totalCarbs += food.carbs * (food.actualWeight / food.servingWeight);
  });
  return [totalCalories, totalProtein, totalFat, totalCarbs];
}

/**

Update the actual weight of a selected food
@param {string} foodName - The name of the food to update
@param {number} weight - The new weight of the food
*/
function updateFoodItem(foodName, weight) {
  selectedFoods.forEach((food) => {
    if (food.foodName === foodName) {
      food.actualWeight = weight;
    }
  });
  displayMealForm();
}

//Submit meal form
function requestLogCreation() {
  let formParams = {
    mealLog: JSON.stringify({
      mealLogName: document.getElementById("meal-name").value,
      foods: selectedFoods,
      logNote: document.getElementById("meal-note").value,
    }),
  };
  console.log(formParams);
  post("/CICOHealth/user/meal-logs", formParams);
}

let mealName = "";
let logNote = "";
