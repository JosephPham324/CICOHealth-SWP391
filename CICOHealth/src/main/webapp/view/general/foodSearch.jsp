<%-- Document : FoodSearch Created on : Feb 17, 2023, 8:48:24 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        ${initParam.Bootstrap}
        ${initParam.FontAwesome}
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/foodsearch.css" />
        <title>Food Search | ${initParam.webappName}</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>

        <!--Pop up form-->
        <div class="pop-up" id="meal-pop-up">
            <div class="overlay"></div>
            <div class="pop-up-content">
                <form id="meal-form" onsubmit="event.preventDefault();requestLogCreation();" data-enabled="${sessionScope.user != null}">
                </form>
            </div>
        </div>
        <main>
            <div class="search-bar">
                <form onsubmit="event.preventDefault();sendRequest(document.getElementById('foodSearchInput').value)"
                  class="search-bar-input">
                  <div class="search-box">
                    <button class="btn-search"><i class="fas fa-search"></i></button>
                    <input type="search" class="input-search" name="foodSearchInput" id="foodSearchInput" placeholder="Type to Search...">
                  </div>
                </form>
                <button id="food-cart">
                  <span id="selected-number">0</span><i class="fa-solid fa-bowl-food"></i>
                </button>
              </div>
              
            <div class="search-results" id="search-results">
                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;apple&quot;,&quot;servingWeight&quot;:182,&quot;calories&quot;:94.64,&quot;protein&quot;:0.47,&quot;fat&quot;:0.31,&quot;carbs&quot;:25.13,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/384_highres.jpg&quot;,&quot;actualWeight&quot;:182}">
                    <h3 class="search-result-name">apple</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/384_highres.jpg"
                                 alt="apple photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 182(g)</span>
                            <span class="search-result-calories">Kcal: 94.64</span>
                            <span class="search-result-protein">Protein: 0.47</span>
                            <span class="search-result-fat">Fat: 0.31</span>
                            <span class="search-result-carbs">Carbs: 25.13</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;banana&quot;,&quot;servingWeight&quot;:118,&quot;calories&quot;:105.02,&quot;protein&quot;:1.29,&quot;fat&quot;:0.39,&quot;carbs&quot;:26.95,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/399_highres.jpg&quot;,&quot;actualWeight&quot;:118}">
                    <h3 class="search-result-name">banana</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/399_highres.jpg"
                                 alt="banana photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 118(g)</span>
                            <span class="search-result-calories">Kcal: 105.02</span>
                            <span class="search-result-protein">Protein: 1.29</span>
                            <span class="search-result-fat">Fat: 0.39</span>
                            <span class="search-result-carbs">Carbs: 26.95</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;orange&quot;,&quot;servingWeight&quot;:140,&quot;calories&quot;:68.6,&quot;protein&quot;:1.27,&quot;fat&quot;:0.21,&quot;carbs&quot;:17.56,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/719_highres.jpg&quot;,&quot;actualWeight&quot;:140}">
                    <h3 class="search-result-name">orange</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/719_highres.jpg"
                                 alt="orange photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 140(g)</span>
                            <span class="search-result-calories">Kcal: 68.6</span>
                            <span class="search-result-protein">Protein: 1.27</span>
                            <span class="search-result-fat">Fat: 0.21</span>
                            <span class="search-result-carbs">Carbs: 17.56</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;watermelon&quot;,&quot;servingWeight&quot;:286,&quot;calories&quot;:85.8,&quot;protein&quot;:1.74,&quot;fat&quot;:0.43,&quot;carbs&quot;:21.59,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/869_highres.jpg&quot;,&quot;actualWeight&quot;:286}">
                    <h3 class="search-result-name">watermelon</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/869_highres.jpg"
                                 alt="watermelon photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 286(g)</span>
                            <span class="search-result-calories">Kcal: 85.8</span>
                            <span class="search-result-protein">Protein: 1.74</span>
                            <span class="search-result-fat">Fat: 0.43</span>
                            <span class="search-result-carbs">Carbs: 21.59</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;kiwi&quot;,&quot;servingWeight&quot;:69,&quot;calories&quot;:42.09,&quot;protein&quot;:0.79,&quot;fat&quot;:0.36,&quot;carbs&quot;:10.12,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/647_highres.jpg&quot;,&quot;actualWeight&quot;:69}">
                    <h3 class="search-result-name">kiwi</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/647_highres.jpg" alt="kiwi photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 69(g)</span>
                            <span class="search-result-calories">Kcal: 42.09</span>
                            <span class="search-result-protein">Protein: 0.79</span>
                            <span class="search-result-fat">Fat: 0.36</span>
                            <span class="search-result-carbs">Carbs: 10.12</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;carrot&quot;,&quot;servingWeight&quot;:46,&quot;calories&quot;:16.1,&quot;protein&quot;:0.35,&quot;fat&quot;:0.08,&quot;carbs&quot;:3.78,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/452_highres.jpg&quot;,&quot;actualWeight&quot;:46}">
                    <h3 class="search-result-name">carrot</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/452_highres.jpg"
                                 alt="carrot photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 46(g)</span>
                            <span class="search-result-calories">Kcal: 16.1</span>
                            <span class="search-result-protein">Protein: 0.35</span>
                            <span class="search-result-fat">Fat: 0.08</span>
                            <span class="search-result-carbs">Carbs: 3.78</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;mushroom&quot;,&quot;servingWeight&quot;:12,&quot;calories&quot;:3.36,&quot;protein&quot;:0.26,&quot;fat&quot;:0.06,&quot;carbs&quot;:0.63,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/148_highres.jpg&quot;,&quot;actualWeight&quot;:12}">
                    <h3 class="search-result-name">mushroom</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/148_highres.jpg"
                                 alt="mushroom photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 12(g)</span>
                            <span class="search-result-calories">Kcal: 3.36</span>
                            <span class="search-result-protein">Protein: 0.26</span>
                            <span class="search-result-fat">Fat: 0.06</span>
                            <span class="search-result-carbs">Carbs: 0.63</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;potato&quot;,&quot;servingWeight&quot;:173,&quot;calories&quot;:160.89,&quot;protein&quot;:4.33,&quot;fat&quot;:0.22,&quot;carbs&quot;:36.59,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/752_highres.jpg&quot;,&quot;actualWeight&quot;:173}">
                    <h3 class="search-result-name">potato</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/752_highres.jpg"
                                 alt="potato photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 173(g)</span>
                            <span class="search-result-calories">Kcal: 160.89</span>
                            <span class="search-result-protein">Protein: 4.33</span>
                            <span class="search-result-fat">Fat: 0.22</span>
                            <span class="search-result-carbs">Carbs: 36.59</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;sweet potato&quot;,&quot;servingWeight&quot;:114,&quot;calories&quot;:102.6,&quot;protein&quot;:2.29,&quot;fat&quot;:0.17,&quot;carbs&quot;:23.61,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/208_highres.jpg&quot;,&quot;actualWeight&quot;:114}">
                    <h3 class="search-result-name">sweet potato</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/208_highres.jpg"
                                 alt="sweet potato photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 114(g)</span>
                            <span class="search-result-calories">Kcal: 102.6</span>
                            <span class="search-result-protein">Protein: 2.29</span>
                            <span class="search-result-fat">Fat: 0.17</span>
                            <span class="search-result-carbs">Carbs: 23.61</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;broccoli&quot;,&quot;servingWeight&quot;:10,&quot;calories&quot;:3.5,&quot;protein&quot;:0.24,&quot;fat&quot;:0.04,&quot;carbs&quot;:0.72,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/363_highres.jpg&quot;,&quot;actualWeight&quot;:10}">
                    <h3 class="search-result-name">broccoli</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/363_highres.jpg"
                                 alt="broccoli photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 10(g)</span>
                            <span class="search-result-calories">Kcal: 3.5</span>
                            <span class="search-result-protein">Protein: 0.24</span>
                            <span class="search-result-fat">Fat: 0.04</span>
                            <span class="search-result-carbs">Carbs: 0.72</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;cauliflower&quot;,&quot;servingWeight&quot;:575,&quot;calories&quot;:132.25,&quot;protein&quot;:10.58,&quot;fat&quot;:2.59,&quot;carbs&quot;:23.63,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/315_highres.jpg&quot;,&quot;actualWeight&quot;:575}">
                    <h3 class="search-result-name">cauliflower</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/315_highres.jpg"
                                 alt="cauliflower photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 575(g)</span>
                            <span class="search-result-calories">Kcal: 132.25</span>
                            <span class="search-result-protein">Protein: 10.58</span>
                            <span class="search-result-fat">Fat: 2.59</span>
                            <span class="search-result-carbs">Carbs: 23.63</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;cabbage&quot;,&quot;servingWeight&quot;:75,&quot;calories&quot;:17.25,&quot;protein&quot;:0.95,&quot;fat&quot;:0.05,&quot;carbs&quot;:4.13,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/447_highres.jpg&quot;,&quot;actualWeight&quot;:75}">
                    <h3 class="search-result-name">cabbage</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/447_highres.jpg"
                                 alt="cabbage photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 75(g)</span>
                            <span class="search-result-calories">Kcal: 17.25</span>
                            <span class="search-result-protein">Protein: 0.95</span>
                            <span class="search-result-fat">Fat: 0.05</span>
                            <span class="search-result-carbs">Carbs: 4.13</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;spinach&quot;,&quot;servingWeight&quot;:180,&quot;calories&quot;:41.4,&quot;protein&quot;:5.35,&quot;fat&quot;:0.47,&quot;carbs&quot;:6.75,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/263_highres.jpg&quot;,&quot;actualWeight&quot;:180}">
                    <h3 class="search-result-name">spinach</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/263_highres.jpg"
                                 alt="spinach photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 180(g)</span>
                            <span class="search-result-calories">Kcal: 41.4</span>
                            <span class="search-result-protein">Protein: 5.35</span>
                            <span class="search-result-fat">Fat: 0.47</span>
                            <span class="search-result-carbs">Carbs: 6.75</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;lettuce&quot;,&quot;servingWeight&quot;:94,&quot;calories&quot;:15.98,&quot;protein&quot;:1.16,&quot;fat&quot;:0.28,&quot;carbs&quot;:3.09,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/657_highres.jpg&quot;,&quot;actualWeight&quot;:94}">
                    <h3 class="search-result-name">lettuce</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/657_highres.jpg"
                                 alt="lettuce photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 94(g)</span>
                            <span class="search-result-calories">Kcal: 15.98</span>
                            <span class="search-result-protein">Protein: 1.16</span>
                            <span class="search-result-fat">Fat: 0.28</span>
                            <span class="search-result-carbs">Carbs: 3.09</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;kale&quot;,&quot;servingWeight&quot;:130,&quot;calories&quot;:36.4,&quot;protein&quot;:2.47,&quot;fat&quot;:0.52,&quot;carbs&quot;:7.32,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/644_highres.jpg&quot;,&quot;actualWeight&quot;:130}">
                    <h3 class="search-result-name">kale</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/644_highres.jpg" alt="kale photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 130(g)</span>
                            <span class="search-result-calories">Kcal: 36.4</span>
                            <span class="search-result-protein">Protein: 2.47</span>
                            <span class="search-result-fat">Fat: 0.52</span>
                            <span class="search-result-carbs">Carbs: 7.32</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;onion&quot;,&quot;servingWeight&quot;:94,&quot;calories&quot;:41.36,&quot;protein&quot;:1.28,&quot;fat&quot;:0.18,&quot;carbs&quot;:9.54,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/717_highres.jpg&quot;,&quot;actualWeight&quot;:94}">
                    <h3 class="search-result-name">onion</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/717_highres.jpg"
                                 alt="onion photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 94(g)</span>
                            <span class="search-result-calories">Kcal: 41.36</span>
                            <span class="search-result-protein">Protein: 1.28</span>
                            <span class="search-result-fat">Fat: 0.18</span>
                            <span class="search-result-carbs">Carbs: 9.54</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;green beans&quot;,&quot;servingWeight&quot;:125,&quot;calories&quot;:43.75,&quot;protein&quot;:2.36,&quot;fat&quot;:0.35,&quot;carbs&quot;:9.85,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/189_highres.jpg&quot;,&quot;actualWeight&quot;:125}">
                    <h3 class="search-result-name">green beans</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/189_highres.jpg"
                                 alt="green beans photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 125(g)</span>
                            <span class="search-result-calories">Kcal: 43.75</span>
                            <span class="search-result-protein">Protein: 2.36</span>
                            <span class="search-result-fat">Fat: 0.35</span>
                            <span class="search-result-carbs">Carbs: 9.85</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;peas&quot;,&quot;servingWeight&quot;:160,&quot;calories&quot;:134.4,&quot;protein&quot;:8.58,&quot;fat&quot;:0.35,&quot;carbs&quot;:25.01,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/728_highres.jpg&quot;,&quot;actualWeight&quot;:160}">
                    <h3 class="search-result-name">peas</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/728_highres.jpg" alt="peas photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 160(g)</span>
                            <span class="search-result-calories">Kcal: 134.4</span>
                            <span class="search-result-protein">Protein: 8.58</span>
                            <span class="search-result-fat">Fat: 0.35</span>
                            <span class="search-result-carbs">Carbs: 25.01</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;lentils&quot;,&quot;servingWeight&quot;:198,&quot;calories&quot;:229.68,&quot;protein&quot;:17.86,&quot;fat&quot;:0.75,&quot;carbs&quot;:39.86,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/230_highres.jpg&quot;,&quot;actualWeight&quot;:198}">
                    <h3 class="search-result-name">lentils</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/230_highres.jpg"
                                 alt="lentils photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 198(g)</span>
                            <span class="search-result-calories">Kcal: 229.68</span>
                            <span class="search-result-protein">Protein: 17.86</span>
                            <span class="search-result-fat">Fat: 0.75</span>
                            <span class="search-result-carbs">Carbs: 39.86</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;chickpeas&quot;,&quot;servingWeight&quot;:164,&quot;calories&quot;:268.96,&quot;protein&quot;:14.53,&quot;fat&quot;:4.25,&quot;carbs&quot;:44.97,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/577_highres.jpg&quot;,&quot;actualWeight&quot;:164}">
                    <h3 class="search-result-name">chickpeas</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/577_highres.jpg"
                                 alt="chickpeas photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 164(g)</span>
                            <span class="search-result-calories">Kcal: 268.96</span>
                            <span class="search-result-protein">Protein: 14.53</span>
                            <span class="search-result-fat">Fat: 4.25</span>
                            <span class="search-result-carbs">Carbs: 44.97</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;kidney beans&quot;,&quot;servingWeight&quot;:177,&quot;calories&quot;:224.79,&quot;protein&quot;:15.35,&quot;fat&quot;:0.89,&quot;carbs&quot;:40.36,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/2179_highres.jpg&quot;,&quot;actualWeight&quot;:177}">
                    <h3 class="search-result-name">kidney beans</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/2179_highres.jpg"
                                 alt="kidney beans photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 177(g)</span>
                            <span class="search-result-calories">Kcal: 224.79</span>
                            <span class="search-result-protein">Protein: 15.35</span>
                            <span class="search-result-fat">Fat: 0.89</span>
                            <span class="search-result-carbs">Carbs: 40.36</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;black beans&quot;,&quot;servingWeight&quot;:172,&quot;calories&quot;:227.04,&quot;protein&quot;:15.24,&quot;fat&quot;:0.93,&quot;carbs&quot;:40.78,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/245_highres.jpg&quot;,&quot;actualWeight&quot;:172}">
                    <h3 class="search-result-name">black beans</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/245_highres.jpg"
                                 alt="black beans photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 172(g)</span>
                            <span class="search-result-calories">Kcal: 227.04</span>
                            <span class="search-result-protein">Protein: 15.24</span>
                            <span class="search-result-fat">Fat: 0.93</span>
                            <span class="search-result-carbs">Carbs: 40.78</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;pinto beans&quot;,&quot;servingWeight&quot;:171,&quot;calories&quot;:244.53,&quot;protein&quot;:15.41,&quot;fat&quot;:1.11,&quot;carbs&quot;:44.84,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/231_highres.jpg&quot;,&quot;actualWeight&quot;:171}">
                    <h3 class="search-result-name">pinto beans</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/231_highres.jpg"
                                 alt="pinto beans photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 171(g)</span>
                            <span class="search-result-calories">Kcal: 244.53</span>
                            <span class="search-result-protein">Protein: 15.41</span>
                            <span class="search-result-fat">Fat: 1.11</span>
                            <span class="search-result-carbs">Carbs: 44.84</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;tuna&quot;,&quot;servingWeight&quot;:85,&quot;calories&quot;:110.5,&quot;protein&quot;:24.78,&quot;fat&quot;:0.5,&quot;carbs&quot;:0,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/2992_highres.jpg&quot;,&quot;actualWeight&quot;:85}">
                    <h3 class="search-result-name">tuna</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/2992_highres.jpg"
                                 alt="tuna photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 85(g)</span>
                            <span class="search-result-calories">Kcal: 110.5</span>
                            <span class="search-result-protein">Protein: 24.78</span>
                            <span class="search-result-fat">Fat: 0.5</span>
                            <span class="search-result-carbs">Carbs: 0</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;salmon&quot;,&quot;servingWeight&quot;:227,&quot;calories&quot;:467.62,&quot;protein&quot;:50.17,&quot;fat&quot;:28.03,&quot;carbs&quot;:0,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/375_highres.jpg&quot;,&quot;actualWeight&quot;:227}">
                    <h3 class="search-result-name">salmon</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/375_highres.jpg"
                                 alt="salmon photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 227(g)</span>
                            <span class="search-result-calories">Kcal: 467.62</span>
                            <span class="search-result-protein">Protein: 50.17</span>
                            <span class="search-result-fat">Fat: 28.03</span>
                            <span class="search-result-carbs">Carbs: 0</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;shrimp&quot;,&quot;servingWeight&quot;:5,&quot;calories&quot;:5.95,&quot;protein&quot;:1.14,&quot;fat&quot;:0.09,&quot;carbs&quot;:0.08,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/204_highres.jpg&quot;,&quot;actualWeight&quot;:5}">
                    <h3 class="search-result-name">shrimp</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/204_highres.jpg"
                                 alt="shrimp photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 5(g)</span>
                            <span class="search-result-calories">Kcal: 5.95</span>
                            <span class="search-result-protein">Protein: 1.14</span>
                            <span class="search-result-fat">Fat: 0.09</span>
                            <span class="search-result-carbs">Carbs: 0.08</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;chicken&quot;,&quot;servingWeight&quot;:85,&quot;calories&quot;:187,&quot;protein&quot;:20.37,&quot;fat&quot;:11.11,&quot;carbs&quot;:0.04,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/9_highres.jpg&quot;,&quot;actualWeight&quot;:85}">
                    <h3 class="search-result-name">chicken</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/9_highres.jpg"
                                 alt="chicken photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 85(g)</span>
                            <span class="search-result-calories">Kcal: 187</span>
                            <span class="search-result-protein">Protein: 20.37</span>
                            <span class="search-result-fat">Fat: 11.11</span>
                            <span class="search-result-carbs">Carbs: 0.04</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;eggs&quot;,&quot;servingWeight&quot;:50,&quot;calories&quot;:71.5,&quot;protein&quot;:6.28,&quot;fat&quot;:4.76,&quot;carbs&quot;:0.36,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/542_highres.jpg&quot;,&quot;actualWeight&quot;:50}">
                    <h3 class="search-result-name">eggs</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/542_highres.jpg" alt="eggs photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 50(g)</span>
                            <span class="search-result-calories">Kcal: 71.5</span>
                            <span class="search-result-protein">Protein: 6.28</span>
                            <span class="search-result-fat">Fat: 4.76</span>
                            <span class="search-result-carbs">Carbs: 0.36</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;milk&quot;,&quot;servingWeight&quot;:244,&quot;calories&quot;:122,&quot;protein&quot;:8.05,&quot;fat&quot;:4.83,&quot;carbs&quot;:11.71,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/377_highres.jpg&quot;,&quot;actualWeight&quot;:244}">
                    <h3 class="search-result-name">milk</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/377_highres.jpg" alt="milk photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 244(g)</span>
                            <span class="search-result-calories">Kcal: 122</span>
                            <span class="search-result-protein">Protein: 8.05</span>
                            <span class="search-result-fat">Fat: 4.83</span>
                            <span class="search-result-carbs">Carbs: 11.71</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;yogurt&quot;,&quot;servingWeight&quot;:170,&quot;calories&quot;:107.1,&quot;protein&quot;:8.93,&quot;fat&quot;:2.64,&quot;carbs&quot;:11.97,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/186_highres.jpg&quot;,&quot;actualWeight&quot;:170}">
                    <h3 class="search-result-name">yogurt</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/186_highres.jpg"
                                 alt="yogurt photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 170(g)</span>
                            <span class="search-result-calories">Kcal: 107.1</span>
                            <span class="search-result-protein">Protein: 8.93</span>
                            <span class="search-result-fat">Fat: 2.64</span>
                            <span class="search-result-carbs">Carbs: 11.97</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;cheese&quot;,&quot;servingWeight&quot;:28,&quot;calories&quot;:113.12,&quot;protein&quot;:6.4,&quot;fat&quot;:9.33,&quot;carbs&quot;:0.87,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1034_highres.jpg&quot;,&quot;actualWeight&quot;:28}">
                    <h3 class="search-result-name">cheese</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1034_highres.jpg"
                                 alt="cheese photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 28(g)</span>
                            <span class="search-result-calories">Kcal: 113.12</span>
                            <span class="search-result-protein">Protein: 6.4</span>
                            <span class="search-result-fat">Fat: 9.33</span>
                            <span class="search-result-carbs">Carbs: 0.87</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;honey&quot;,&quot;servingWeight&quot;:21,&quot;calories&quot;:63.84,&quot;protein&quot;:0.06,&quot;fat&quot;:0,&quot;carbs&quot;:17.3,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/20_highres.jpg&quot;,&quot;actualWeight&quot;:21}">
                    <h3 class="search-result-name">honey</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/20_highres.jpg" alt="honey photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 21(g)</span>
                            <span class="search-result-calories">Kcal: 63.84</span>
                            <span class="search-result-protein">Protein: 0.06</span>
                            <span class="search-result-fat">Fat: 0</span>
                            <span class="search-result-carbs">Carbs: 17.3</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;bread&quot;,&quot;servingWeight&quot;:29,&quot;calories&quot;:77.14,&quot;protein&quot;:2.57,&quot;fat&quot;:0.97,&quot;carbs&quot;:14.33,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/8_highres.jpg&quot;,&quot;actualWeight&quot;:29}">
                    <h3 class="search-result-name">bread</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/8_highres.jpg" alt="bread photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 29(g)</span>
                            <span class="search-result-calories">Kcal: 77.14</span>
                            <span class="search-result-protein">Protein: 2.57</span>
                            <span class="search-result-fat">Fat: 0.97</span>
                            <span class="search-result-carbs">Carbs: 14.33</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;oatmeal&quot;,&quot;servingWeight&quot;:234,&quot;calories&quot;:166.14,&quot;protein&quot;:5.94,&quot;fat&quot;:3.56,&quot;carbs&quot;:28.08,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/87_highres.jpg&quot;,&quot;actualWeight&quot;:234}">
                    <h3 class="search-result-name">oatmeal</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/87_highres.jpg"
                                 alt="oatmeal photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 234(g)</span>
                            <span class="search-result-calories">Kcal: 166.14</span>
                            <span class="search-result-protein">Protein: 5.94</span>
                            <span class="search-result-fat">Fat: 3.56</span>
                            <span class="search-result-carbs">Carbs: 28.08</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;granola&quot;,&quot;servingWeight&quot;:61,&quot;calories&quot;:298.29,&quot;protein&quot;:8.34,&quot;fat&quot;:14.83,&quot;carbs&quot;:32.87,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/7_highres.jpg&quot;,&quot;actualWeight&quot;:61}">
                    <h3 class="search-result-name">granola</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/7_highres.jpg"
                                 alt="granola photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 61(g)</span>
                            <span class="search-result-calories">Kcal: 298.29</span>
                            <span class="search-result-protein">Protein: 8.34</span>
                            <span class="search-result-fat">Fat: 14.83</span>
                            <span class="search-result-carbs">Carbs: 32.87</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;pasta&quot;,&quot;servingWeight&quot;:124,&quot;calories&quot;:195.92,&quot;protein&quot;:7.19,&quot;fat&quot;:1.15,&quot;carbs&quot;:38.27,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1012_highres.jpg&quot;,&quot;actualWeight&quot;:124}">
                    <h3 class="search-result-name">pasta</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1012_highres.jpg"
                                 alt="pasta photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 124(g)</span>
                            <span class="search-result-calories">Kcal: 195.92</span>
                            <span class="search-result-protein">Protein: 7.19</span>
                            <span class="search-result-fat">Fat: 1.15</span>
                            <span class="search-result-carbs">Carbs: 38.27</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;rice&quot;,&quot;servingWeight&quot;:158,&quot;calories&quot;:205.4,&quot;protein&quot;:4.25,&quot;fat&quot;:0.44,&quot;carbs&quot;:44.51,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/784_highres.jpg&quot;,&quot;actualWeight&quot;:158}">
                    <h3 class="search-result-name">rice</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/784_highres.jpg" alt="rice photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 158(g)</span>
                            <span class="search-result-calories">Kcal: 205.4</span>
                            <span class="search-result-protein">Protein: 4.25</span>
                            <span class="search-result-fat">Fat: 0.44</span>
                            <span class="search-result-carbs">Carbs: 44.51</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;quinoa&quot;,&quot;servingWeight&quot;:92.5,&quot;calories&quot;:111,&quot;protein&quot;:4.07,&quot;fat&quot;:1.78,&quot;carbs&quot;:19.7,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/762_highres.jpg&quot;,&quot;actualWeight&quot;:92.5}">
                    <h3 class="search-result-name">quinoa</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/762_highres.jpg"
                                 alt="quinoa photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 92.5(g)</span>
                            <span class="search-result-calories">Kcal: 111</span>
                            <span class="search-result-protein">Protein: 4.07</span>
                            <span class="search-result-fat">Fat: 1.78</span>
                            <span class="search-result-carbs">Carbs: 19.7</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;couscous&quot;,&quot;servingWeight&quot;:157,&quot;calories&quot;:175.84,&quot;protein&quot;:5.95,&quot;fat&quot;:0.25,&quot;carbs&quot;:36.46,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/33_highres.jpg&quot;,&quot;actualWeight&quot;:157}">
                    <h3 class="search-result-name">couscous</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/33_highres.jpg"
                                 alt="couscous photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 157(g)</span>
                            <span class="search-result-calories">Kcal: 175.84</span>
                            <span class="search-result-protein">Protein: 5.95</span>
                            <span class="search-result-fat">Fat: 0.25</span>
                            <span class="search-result-carbs">Carbs: 36.46</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;sandwich&quot;,&quot;servingWeight&quot;:58,&quot;calories&quot;:154.86,&quot;protein&quot;:6.22,&quot;fat&quot;:1.88,&quot;carbs&quot;:28.23,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/202_highres.jpg&quot;,&quot;actualWeight&quot;:58}">
                    <h3 class="search-result-name">sandwich</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/202_highres.jpg"
                                 alt="sandwich photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 58(g)</span>
                            <span class="search-result-calories">Kcal: 154.86</span>
                            <span class="search-result-protein">Protein: 6.22</span>
                            <span class="search-result-fat">Fat: 1.88</span>
                            <span class="search-result-carbs">Carbs: 28.23</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;tacos&quot;,&quot;servingWeight&quot;:102,&quot;calories&quot;:210.12,&quot;protein&quot;:9.44,&quot;fat&quot;:9.95,&quot;carbs&quot;:20.63,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1646_highres.jpg&quot;,&quot;actualWeight&quot;:102}">
                    <h3 class="search-result-name">tacos</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1646_highres.jpg"
                                 alt="tacos photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 102(g)</span>
                            <span class="search-result-calories">Kcal: 210.12</span>
                            <span class="search-result-protein">Protein: 9.44</span>
                            <span class="search-result-fat">Fat: 9.95</span>
                            <span class="search-result-carbs">Carbs: 20.63</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;burritos&quot;,&quot;servingWeight&quot;:241,&quot;calories&quot;:433.8,&quot;protein&quot;:16.94,&quot;fat&quot;:16.39,&quot;carbs&quot;:56.32,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1200_highres.jpg&quot;,&quot;actualWeight&quot;:241}">
                    <h3 class="search-result-name">burritos</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1200_highres.jpg"
                                 alt="burritos photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 241(g)</span>
                            <span class="search-result-calories">Kcal: 433.8</span>
                            <span class="search-result-protein">Protein: 16.94</span>
                            <span class="search-result-fat">Fat: 16.39</span>
                            <span class="search-result-carbs">Carbs: 56.32</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;sushi&quot;,&quot;servingWeight&quot;:211.07,&quot;calories&quot;:348.54,&quot;protein&quot;:7.81,&quot;fat&quot;:18.75,&quot;carbs&quot;:37.89,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1719_highres.jpg&quot;,&quot;actualWeight&quot;:211.07}">
                    <h3 class="search-result-name">sushi</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1719_highres.jpg"
                                 alt="sushi photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 211.07(g)</span>
                            <span class="search-result-calories">Kcal: 348.54</span>
                            <span class="search-result-protein">Protein: 7.81</span>
                            <span class="search-result-fat">Fat: 18.75</span>
                            <span class="search-result-carbs">Carbs: 37.89</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>

                <div class="search-result"
                     data-food="{&quot;foodName&quot;:&quot;pad thai&quot;,&quot;servingWeight&quot;:494.25,&quot;calories&quot;:838.4,&quot;protein&quot;:64.07,&quot;fat&quot;:44.65,&quot;carbs&quot;:45.59,&quot;photo&quot;:&quot;https://nix-tag-images.s3.amazonaws.com/1204_highres.jpg&quot;,&quot;actualWeight&quot;:494.25}">
                    <h3 class="search-result-name">pad thai</h3>
                    <div class="search-result-content">
                        <div class="search-result-image">
                            <img src="https://nix-tag-images.s3.amazonaws.com/1204_highres.jpg"
                                 alt="pad thai photo">
                        </div>
                        <div class="search-result-description">
                            <span class="search-result-quantity">Serving: 494.25(g)</span>
                            <span class="search-result-calories">Kcal: 838.4</span>
                            <span class="search-result-protein">Protein: 64.07</span>
                            <span class="search-result-fat">Fat: 44.65</span>
                            <span class="search-result-carbs">Carbs: 45.59</span>
                            <button class="search-result-button">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
        <script src="/CICOHealth/assets/scripts/validate.js"></script>
        <!--Sending request-->
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <!--Behaviour script-->
        <script src="/CICOHealth/assets/scripts/foodsearch.js"></script>
    </body>

</html>