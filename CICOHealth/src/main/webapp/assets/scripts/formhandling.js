/**
 * sends a request to the specified url from a form. this will change the window location.
 * @param {string} path the path to send the post request to
 * @param {object} params the parameters to add to the url
 * @param {string} [method=post] the method to use on the form
 */
function post(path, params, method = "post") {
    // The rest of this code assumes you are not using a library.
    // It can be made less verbose if you use one.
    const form = document.createElement("form");
    form.method = method;
    form.action = path;

    for (const key in params) {
        if (params.hasOwnProperty(key)) {
            const hiddenField = document.createElement("input");
            hiddenField.type = "hidden";
            hiddenField.name = key;
            hiddenField.value = params[key];

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}

/**
 * Parse a JSON Web Token into JSON object
 * @param {string} token Token to parse
 * @returns JSON after parsing
 */
function parseJwt(token) {
    var base64Url = token.split(".")[1];
    var base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
    var jsonPayload = decodeURIComponent(
            window
            .atob(base64)
            .split("")
            .map(function (c) {
                return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
            })
            .join("")
            );

    return JSON.parse(jsonPayload);
}

/**
 * Split a string using a token, then chain the result with another token
 * @param {string} str String to chain
 * @param {string} splitToken Token to split
 * @param {string} chainToken Token to chain
 * @returns Chained string after splitting
 */
function chainString(str, splitToken, chainToken) {
    return str.split(splitToken).join(chainToken);
}

function getRequestParameter(name){
    if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
       return decodeURIComponent(name[1]);
 }