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
    <!--Bootstrap CDN-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    />
    <!--Font awesome CDN-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
      integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <title>Food Search</title>
  </head>
  <body>
    <!--Pop up form-->
    <div class="pop-up" id="meal-pop-up">
      <div class="overlay"></div>
      <div class="pop-up-content">
        <form
          id="meal-form"
          onsubmit="event.preventDefault();requestLogCreation();"
        >
          <div class="form-group row" class="food-item">
            <div class="col-3">
              <input
                id="weight-"
                name="weight-"
                type="number"
                class="form-control"
                required="required"
              />
            </div>
          </div>
        </form>
      </div>
    </div>
    <main>
      <div class="search-bar">
        <form
          onsubmit="event.preventDefault();sendRequest(document.getElementById('foodSearchInput').value)"
          class="search-bar-input"
        >
          <div class="search-bar-input-field">
            <input type="search" name="foodSearchInput" id="foodSearchInput" />
            <input type="submit" value="Search" />
          </div>
        </form>
        <button id="food-cart">
          <span id="selected-number">0</span
          ><i class="fa-solid fa-bowl-food"></i>
        </button>
      </div>
      <div class="search-results" id="search-results"></div>
    </main>
    <!--Sending request-->
    <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
    <!--Behaviour script-->
    <script src="/CICOHealth/assets/scripts/foodsearch.js"></script>
  </body>
</html>
