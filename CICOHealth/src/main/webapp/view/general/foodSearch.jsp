<%-- Document : FoodSearch Created on : Feb 17, 2023, 8:48:24 AM Author : Pham
Nhat Quang CE170036 (FPTU CANTHO) --%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/CICOHealth/assets/sass/main/foodsearch.css" />
    <title>Food Search</title>
  </head>
  <body>
    <main>
      <div class="search-bar">
        <form
          onsubmit="event.preventDefault();sendRequest(document.getElementById('foodSearchInput').value)"
          class="search-bar-input"
        >
          <div class="search-bar-input-field">
            <input type="search" name="foodSearchInput" id="foodSearchInput" />
            <input type="submit" value="Search" />
            <button id="food-cart">View Meal</button>
          </div>
        </form>
      </div>
      <div class="search-results" id="search-results">
      </div>
    </main>

    <script>
      //Send request of 100 common foods, separated by commas
      //       sendRequest(`Apple
      // Banana
      // Orange
      // Peach
      // Mango
      // Grapes
      // Watermelon
      // Cantaloupe
      // Pineapple
      // Kiwi
      // Blueberries
      // Strawberries
      // Raspberries
      // Blackberries
      // Grapefruit
      // Lemon
      // Lime
      // Avocado
      // Tomato
      // Cucumber
      // Carrot
      // Bell pepper
      // Mushroom
      // Potato
      // Sweet potato
      // Corn
      // Broccoli
      // Cauliflower
      // Cabbage
      // Spinach
      // Lettuce
      // Kale
      // Onion
      // Garlic
      // Ginger
      // Celery
      // Green beans
      // Peas
      // Lentils
      // Chickpeas
      // Kidney beans
      // Black beans
      // Pinto beans
      // Tuna
      // Salmon
      // Shrimp
      // Chicken
      // Turkey
      // Beef
      // Pork
      // Lamb
      // Sausage
      // Bacon
      // Eggs
      // Milk
      // Yogurt
      // Cheese
      // Butter
      // Olive oil
      // Coconut oil
      // Canola oil
      // Honey
      // Maple syrup
      // Bread
      // Bagel
      // Croissant
      // Muffin
      // Pancake
      // Waffle
      // Cereal
      // Oatmeal
      // Granola
      // Pasta
      // Rice
      // Quinoa
      // Couscous
      // Pizza
      // Burger
      // Hot dog
      // Sandwich
      // Tacos
      // Burritos
      // Sushi
      // Stir-fry
      // Curry
      // Soup
      // Salad
      // Chili
      // Lasagna
      // Meatloaf
      // Roast chicken
      // Baked potato
      // French fries
      // Hash browns
      // Tater tots
      // Fried rice
      // Pad Thai
      // Biryani
      // Fried chicken
      // Tandoori chicken.`);
    </script>
    <script src="/CICOHealth/assets/scripts/foodsearch.js"></script>
  </body>
</html>
