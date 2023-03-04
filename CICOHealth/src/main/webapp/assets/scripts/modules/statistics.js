/**
 * Fetch statistics data from server
 * @param {String} type Type of data to fetch
 * @param {Date string} startDate Start date of statistics period
 * @param {Date string} endDate End date of statistics period
 * @param {Function} successCallback Function to call on success
 * @param {Function} errorCallback Function to call on error
 * @returns {Object} Data object
 */
async function fetchData(type, startDate, endDate) {
  let allowedTypes = [
    "nutrition",
    "exercise/resistance",
    "exercise/cardio",
    "health-info",
  ];
  if (allowedTypes.indexOf(type) === -1) {
    errorCallback("Invalid type");
    return;
  }
  let url = `/CICOHealth/user/statistics/${type}/data?start=${startDate}&end=${endDate}`;
  let responseData = null;
  //Fetch data from server
  await fetch(url)
    .then((response) => response.json())
    .then((data) => {
      responseData = data;
    });
  //Return data
  return responseData;
}

function analyzeLogDataByDate(logsCollection, attribute) {
  let datePrevious = null;
  let dateCurrent = null;
  let dateData = [];
  let currentDateData = null;
  for (let i = 0; i < logsCollection.length; i++) {
    let log = logsCollection[i];
    dateCurrent = log.logDate;
    if (datePrevious !== dateCurrent) {
      //Add previous date data to date data
      if (currentDateData !== null) dateData.push(currentDateData);
      //Reset date data
      currentDateData = {
        date: dateCurrent,
        data: log[`${attribute}`],
      };
      datePrevious = dateCurrent;
      continue;
    }
    currentDateData.data += log[`${attribute}`];
    datePrevious = dateCurrent;
    if (i === logsCollection.length - 1) {
      dateData.push(currentDateData);
    }
  }
  return dateData;
}

function analyzeTopWeightData(logsCollection) {
  let datePrevious = null;
  let dateCurrent = null;
  let dateData = [];
  let currentDateData = null;
  for (let i = 0; i < logsCollection.length; i++) {
    let log = logsCollection[i];
    dateCurrent = log.logDate;
    let weights = separateString(log.weight, ",");
    let topWeight = getMaxValue(weights);
    if (datePrevious !== dateCurrent) {
      //Add previous date data to date data
      if (currentDateData !== null) dateData.push(currentDateData);
      //Reset date data
      currentDateData = {
        date: dateCurrent,
        data: topWeight,
      };
      datePrevious = dateCurrent;
      continue;
    }
    if (log.weight > currentDateData.data) {
      currentDateData.data = topWeight;
    }
    datePrevious = dateCurrent;
    if (i === logsCollection.length - 1) {
      dateData.push(currentDateData);
    }
  }
  return dateData;
}

function separateString(string, separator) {
    return string.split(separator).map((item) => parseInt(item.trim()));
}

function getMaxValue(array) {
    return Math.max(...array);
}

//Export fetch data function
export { fetchData, analyzeLogDataByDate, analyzeTopWeightData };

//Date picker html, start and end date
