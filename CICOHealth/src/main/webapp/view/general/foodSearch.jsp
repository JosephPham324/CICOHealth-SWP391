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
    <script src="/CICOHealth/assets/scripts/foodsearch.js"></script>
  </body>
</html>
