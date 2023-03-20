<%-- 
    Document   : UnitConversion
    Created on : Nov 23, 2022, 12:58:51 PM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/converter.css" />
        <!-- <link rel="stylesheet" href="./css/boostrap.css" /> -->
       <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <title>Measurements Converter | ${initParam['webappName']}</title>
    </head>
    <body>
        
          <%@include file="/view/general/navbar.jsp" %>
        <div class="converter">
            <nav class="navbar navbar-expand-lg navbar-light bg-light header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home"
                   ><img
                        style="border-radius: 50%"
                        src="${pageContext.request.contextPath}/favicon.png"
                        alt="Icon"
                        width="60"
                        height="60"
                        /></a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a
                                class="nav-link"
                                href="#weight-converter"
                                data-destination="#weight-converter"
                                >Weight <span class="sr-only">(current)</span></a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="#length-converter"
                                data-destination="#length-converter"
                                >Length</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="#energy-converter"
                                data-destination="#energy-converter"
                                >Energy</a
                            >
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="converter-panel active" id="weight-converter">
                <div class="from">
                    <form>
                        <div class ="form-group row">
                            <label for="weight-to-convert" class="col-4">From</label>
                            <div class=" col-8">
                                <select name="to-convert" id="weight-to-convert" class = " form-control">
                                    <option value="mg">Milligrams (mg)</option>
                                    <option value="g">Grams (g)</option>
                                    <option value="kg">Kilograms (kg)</option>
                                    <option value="oz">Ounce (oz)</option>
                                    <option value="lbs">Pounds (lbs)</option>
                                    <option value="st">Stone (st)</option>
                                    <option value="qtr">Quarter (qtr)</option>
                                    <option value="cwt">Hundredweight (cwt)</option>
                                </select>   
                            </div>

                        </div>
                    </form>
                </div>
                <div class="to">
                    <form>
                        <div class ="form-group row">
                            <label for="weight-converted" class="col-4">To</label>
                            <div class ="col-8">
                                <div class="input-group">
                                    <select name="converted" id="weight-converted" class =" form-control ">
                                        <option value="mg">Milligrams (mg)</option>
                                        <option value="g">Grams (g)</option>
                                        <option value="kg">Kilograms (kg)</option>
                                        <option value="oz">Ounce (oz)</option>
                                        <option value="lbs">Pounds (lbs)</option>
                                        <option value="st">Stone (st)</option>
                                        <option value="qtr">Quarter (qtr)</option>
                                        <option value="cwt">Hundredweight (cwt)</option>
                                    </select>     
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <form class="input-output" onsubmit="return false;">
                    <div class="form-group row">
                        <label for="input" class="col-4 col-form-label">Input</label>
                        <div class="col-8 input-field">
                            <div class="input-group">
                                <input
                                    id="input"
                                    name="input"
                                    placeholder="Enter the amount to convert"
                                    type="number"
                                    class="form-control"
                                    value="0"
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="result" class="col-4 col-form-label">Result</label>
                        <div class="col-8">
                            <div class="input-group output-field">
                                <input
                                    id="result"
                                    name="result"
                                    placeholder="Result will be displayed here"
                                    type="text"
                                    class="form-control"
                                    value="0"
                                    readonly
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <div class="tooltip_">
                                <button
                                    name="submit"
                                    class="btn btn-primary"
                                    onclick="copiedTooltip(document.querySelector('#weight-tooltip'))"
                                    onmouseout="resetTooltip(document.querySelector('#weight-tooltip'))"
                                    >
                                    <span class="tooltiptext" id="weight-tooltip">
                                        Copy to clipboard
                                    </span>
                                    Copy result
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!------------------------------------------------------------------>

            <div class="converter-panel" id="energy-converter">
                <div class="from">
                    <form>
                        <div class ="form-group row">
                            <label for="engergy-to-convert" class="col-4">From</label>
                            <div class ="col-8">
                                <div class="input-group">
                                    <select name="to-convert" id="energy-to-convert"  class =" form-control ">
                                        <option value="J">Joules(J)</option>
                                        <option value="kJ">Kilojoules(kJ)</option>
                                        <option value="cal">Calories(cal)</option>
                                        <option value="kcal">Kilocalories(kcal)</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="to">
                    <form>
                        <div class ="form-group row">
                            <label for="energy-converted" class="col-4 col-form-label">To</label>
                            <div class ="col-8">
                                <div class="input-group">
                                    <select name="converted" id="energy-converted"  class ="form-control ">
                                        <option value="J">Joules(J)</option> 
                                        <option value="kJ">Kilojoules(kJ)</option>
                                        <option value="cal">Calories(cal)</option>
                                        <option value="kcal">Kilocalories(kcal)</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <form class="input-output" onsubmit="return false;">
                    <div class="form-group row">
                        <label for="input" class="col-4 col-form-label">Input</label>
                        <div class="col-8 input-field">
                            <div class="input-group">
                                <input
                                    id="input"
                                    name="input"
                                    placeholder="Enter the amount to convert"
                                    type="number"
                                    class="form-control"
                                    value="0"
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="result" class="col-4 col-form-label">Result</label>
                        <div class="col-8">
                            <div class="input-group output-field">
                                <input
                                    id="result"
                                    name="result"
                                    placeholder="Result will be displayed here"
                                    type="text"
                                    class="form-control"
                                    value="0"
                                    readonly
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <div class="tooltip_">
                                <button
                                    name="submit"
                                    class="btn btn-primary"
                                    onclick="copiedTooltip(document.getElementById('energyTooltip'))"
                                    onmouseout="resetTooltip(document.getElementById('energyTooltip'))"
                                    >
                                    <span class="tooltiptext" id="energyTooltip">
                                        Copy to clipboard
                                    </span>
                                    Copy result
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!------------------------------------------------------------------>

            <div class="converter-panel" id="length-converter">
                <div class="from">
                    <form>
                        <div class ="form-group row">
                            <label for="length-to-convert" class="col-4">From</label>
                            <div class ="col-8">
                                <div class="input-group">
                                    <select name="to-convert" id="length-to-convert"  class =" form-control ">
                                        <option value="mm">Millimeters (mm)</option>
                                        <option value="cm">Centimeters (cm)</option>
                                        <option value="dm">Decimeters (cm)</option>
                                        <option value="m">Meters (m)</option>
                                        <option value="km">Kilometers (km)</option>
                                        <option value="in">Inches (in)</option>
                                        <option value="ft">Feet (ft)</option>
                                        <option value="mi">Miles (mi)</option>
                                        <option value="nmi">Nautical miles (nmi)</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="to">
                    <form>
                        <div class ="form-group row">
                            <label for="length-converted" class="col-4">To</label>
                            <div class ="col-8">
                                <div class="input-group">
                                    <select name="converted" id="length-converted"  class =" form-control ">
                                        <option value="mm">Millimeters (mm)</option>
                                        <option value="cm">Centimeters (cm)</option>
                                        <option value="dm">Decimeters (cm)</option>
                                        <option value="m">Meters (m)</option>
                                        <option value="km">Kilometers (km)</option>
                                        <option value="in">Inches (in)</option>
                                        <option value="ft">Feet (ft)</option>
                                        <option value="mi">Miles (mi)</option>
                                        <option value="nmi">Nautical miles (nmi)</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <form class="input-output" onsubmit="return false;">
                    <div class="form-group row">
                        <label for="input" class="col-4 col-form-label">Input</label>
                        <div class="col-8 input-field">
                            <div class="input-group">
                                <input
                                    id="input"
                                    name="input"
                                    placeholder="Enter the amount to convert"
                                    type="number"
                                    class="form-control"
                                    value="0"
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="result" class="col-4 col-form-label">Result</label>
                        <div class="col-8">
                            <div class="input-group output-field" >
                                <input
                                    id="result"
                                    name="result"
                                    placeholder="Result will be displayed here"
                                    type="text"
                                    class="form-control"
                                    value="0"
                                    readonly
                                    />
                                <div class="input-group-append">
                                    <div class="input-group-text">mg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <div class="tooltip_">
                                <button
                                    name="submit"
                                    class="btn btn-primary"
                                    onclick="copiedTooltip(document.getElementById('lengthTooltip'))"
                                    onmouseout="resetTooltip(document.getElementById('lengthTooltip'))"
                                    >
                                    <span class="tooltiptext" id="lengthTooltip">
                                        Copy to clipboard
                                    </span>
                                    Copy result
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
                         <%@include file="/view/general/footer.jsp" %>
        <!-- </div> -->
        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"
        ></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/converter.js"></script>
    </body>
</html>
