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
//Selected foods
let selectedFoods = [];
//Add food to selected foods
function addFood(food) {
  //Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === food.foodName) {
      throw new Error("Food already in selected foods");
    }
  }
  selectedFoods.push(food);
  // console.log(selectedFoods);
}
//Remove food from selected foods
function removeFood(food) {
  //Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === food.foodName) {
      selectedFoods.splice(i, 1);
      return;
    }
  }
  throw new Error("Food not in selected foods");
}
//Remove food from selected foods
function removeFoodByName(foodName) {
  //Check if food is already in selected foods
  for (let i = 0; i < selectedFoods.length; i++) {
    if (selectedFoods[i].foodName === foodName) {
      selectedFoods.splice(i, 1);
      return;
    }
  }
  throw new Error("Food not in selected foods");
}
//Toggle food in selected foods
function toggleFood(food) {
  //Check if food is already in selected foods
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
 * */
function addSearchResultEventListener() {
  let searchResults = document.getElementById("search-results");
  //Iterate through search results
  for (let i = 0; i < searchResults.children.length; i++) {
    let searchResult = searchResults.children[i];
    //Add event listener to search result
    searchResult.addEventListener("click", function () {
      let food = JSON.parse(this.dataset.food);
      if (toggleFood(food) == true) {
        this.classList.add("selected");
        changeButtonText(this, "add");
      } else {
        this.classList.remove("selected");
        changeButtonText(this, "remove");
      }
      updateFoodCartButton();
    });
  }
}
/**
 * Change the text of the button in search result
 *
 * @param {Element} searchResult - The search result element
 */
function changeButtonText(searchResult, state) {
  let button = searchResult.children[1].children[1].children[5];
  // if (button.innerText === "Add") {
  //   button.innerText = "Remove";
  // } else {
  //   button.innerText = "Add";
  // }
  switch (state) {
    case "add":
      button.innerText = "Remove";
      break;
    case "remove":
      button.innerText = "Add";
      break;
    default:
      break;
  }
}
/**
 * Add selected class to search-result elements that contain food in selectedFoods
 * @param {Array} selectedFoods Array of selected foods
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
function updateFoodCartButton() {
  let foodCartButton = document.getElementById("selected-number");
  foodCartButton.innerText = `${selectedFoods.length}`;
}
addSearchResultEventListener();

//Send request of some common foods, separated by new line
sendRequest(`Apple
      Banana
      Orange
      Watermelon
      Kiwi
      Carrot
      Mushroom
      Potato
      Sweet potato
      Corn
      Broccoli
      Cauliflower
      Cabbage
      Spinach
      Lettuce
      Kale
      Onion
      Garlic
      Ginger
      Green beans
      Peas
      Lentils
      Chickpeas
      Kidney beans
      Black beans
      Pinto beans
      Tuna
      Salmon
      Shrimp
      Chicken
      Eggs
      Milk
      Yogurt
      Cheese
      Honey
      Maple syrup
      Bread
      Bagel
      Oatmeal
      Granola
      Pasta
      Rice
      Quinoa
      Couscous
      Pizza
      Burger
      Hot dog
      Sandwich
      Tacos
      Burritos
      Sushi
      Pad Thai`);

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
 * Display meal form pop-up
 */
function displayMealForm() {
  displayPopUp("meal-pop-up");
  let mealForm = document.getElementById("meal-form");
  mealForm.innerHTML = "";
  //Add meal name input
  let htmlMealName = `
  <div class="form-group row">
    <label for="meal-name" class="col-4 col-form-label">Meal Name</label>
    <div class="col-8">
      <input type="text" class="form-control" id="meal-name" placeholder="Meal Name" required = "required">
    </div>
  </div>
  `;
  mealForm.innerHTML += htmlMealName;
  //Iterate through selected foods
  selectedFoods.forEach((food) => {
    let elementHTML = `
  <div class="form-group row" class="food-item">
          <label for="weight-${food.foodName}" class="col-9 col-form-label">
            Name:<span class="food-name">${food.foodName}</span>
            <span class="food-item-calories">Kcal: ${food.calories}</span>
            <span class="food-item-protein">Protein: ${food.protein}</span>
            <span class="food-item-fat">Fat: ${food.fat}</span>
            <span class="food-item-carbs">Carbs: ${food.carbs}</span>
            <span class="food-item-serving-weight">Serving: ${food.servingWeight}</span>
          </label>
          <div class="col-2">
            <input
              id="weight-${food.foodName}"
              name="weight-${food.foodName}"
              type="number"
              class="form-control"
              required="required"
              value="${food.actualWeight}"
              oninput="updateFoodItem('${food.foodName}', this.value)"
            />
          </div>
          <!--Delete button-->
          <div class="col-1">
            <button
              type="button"
              class="btn btn-danger"
              onclick="removeFoodByName('${food.foodName}');displayMealForm();showSelected();"
            >
              <i class="fas fa-trash-alt"></i>
            </button>
          </div>
  </div>
  `;
    //Add food item to meal form
    mealForm.innerHTML += elementHTML;
  });
  //Add submit button to meal form
  mealForm.innerHTML += `
  <div class="form-group row" id="submit-field">
  <div class="offset-4 col-8">
    <button name="submit" type="submit" class="btn btn-primary">
      Create Meal
    </button>
  </div>
  </div>
  `;
}

//Update food item in selectedFoods
function updateFoodItem(foodName, value) {
  let food = selectedFoods.find((food) => food.foodName === foodName);
  //Parse value to integer
  food.actualWeight = parseInt(value);
  let id = `weight-${food.foodName}`;
  //Label selector for food item
  let labelSelector = `label[for="${id}"]`;
  //Fields to update: calories, protein, fat, carbs
  let calories = document.querySelector(`${labelSelector} .food-item-calories`);
  let protein = document.querySelector(`${labelSelector} .food-item-protein`);
  let fat = document.querySelector(`${labelSelector} .food-item-fat`);
  let carbs = document.querySelector(`${labelSelector} .food-item-carbs`);
  //Update fields, multiply by ratio of actual weight to serving weight, two decimal places
  calories.innerText = `Kcal: ${(
    food.calories *
    (food.actualWeight / food.servingWeight)
  ).toFixed(0)}`;
  protein.innerText = `Protein: ${(
    food.protein *
    (food.actualWeight / food.servingWeight)
  ).toFixed(2)}`;
  fat.innerText = `Fat: ${(
    food.fat *
    (food.actualWeight / food.servingWeight)
  ).toFixed(2)}`;
  carbs.innerText = `Carbs: ${(
    food.carbs *
    (food.actualWeight / food.servingWeight)
  ).toFixed(2)}`;
}

//Submit meal form
function requestLogCreation(){
  let formParams = {
    mealName: document.getElementById("meal-name").value,
    foods: selectedFoods
  }
  post("/CICOHealth/meal-logs", formParams);
}