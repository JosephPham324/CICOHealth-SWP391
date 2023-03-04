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
      //   console.log(JSON.stringify(data.logs));
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
//----------------------------------------------------------------------------------------------
/*----------------Exercise statistics-----------------------*/
//----------------Utility functions
function getWeekEndpoints(year, weekNumber) {
  const januaryFirst = new Date(year, 0, 1);
  const dayOfWeek = januaryFirst.getDay();
  const daysInFirstWeek = 7 - dayOfWeek;
  const firstWeekEnd = new Date(year, 0, daysInFirstWeek);
  const daysInWeek = 7;
  const startDate = new Date(
    firstWeekEnd.getTime() + (weekNumber - 2) * daysInWeek * 86400000
  );
  const endDate = new Date(startDate.getTime() + 6 * 86400000);
  return { startDate, endDate };
}
function getWeekNumber(date) {
  const onejan = new Date(date.getFullYear(), 0, 1);
  const millisecsInDay = 86400000;
  return Math.ceil(
    ((date - onejan) / millisecsInDay + onejan.getDay() + 1) / 7
  );
}
//----------------------------------------------------------------------------------------------
//----------------Main functions
function countExercisesPerWeek(data) {
  const exerciseCounts = {};

  data.forEach((log) => {
    const logDate = new Date(log.logDate);
    const year = logDate.getFullYear();
    const week = getWeekNumber(logDate);
    const exerciseName = log.exercise.exerciseName;

    if (!exerciseCounts[year]) {
      exerciseCounts[year] = {};
    }

    if (!exerciseCounts[year][week]) {
      exerciseCounts[year][week] = {
        dateRange: getWeekEndpoints(year, week),
      };
    }

    if (!exerciseCounts[year][week][exerciseName]) {
      exerciseCounts[year][week][exerciseName] = 0;
    }

    exerciseCounts[year][week][exerciseName]++;
  });

  return exerciseCounts;
}

function getExerciseFrequency(exerciseName, data) {
  const exerciseData = {
    name: exerciseName,
    total: 0,
    weeks: [],
  };

  for (const year in data) {
    for (const week in data[year]) {
      if (data[year][week][exerciseName]) {
        const startDate = data[year][week].dateRange.startDate;
        const endDate = data[year][week].dateRange.endDate;
        const count = data[year][week][exerciseName];
        exerciseData.total += count;
        exerciseData.weeks.push({ week, count, startDate, endDate });
      }
    }
  }

  return exerciseData;
}

/**
 * Converts a string of numbers separated by a specified separator into an array of integers.
 *
 * @param {string} string - The string to be converted into an array.
 * @param {string} separator - The separator used to split the string into an array.
 * @returns {number[]} An array of integers extracted from the original string.
 */
function separateString(string, separator) {
  return string.split(separator).map((item) => parseInt(item.trim()));
}

/**
 * Returns the maximum value in an array of numbers.
 *
 * @param {number[]} array - The array of numbers to search for the maximum value.
 * @returns {number} The maximum value in the array.
 */
function getMaxValue(array) {
  return Math.max(...array);
}

/**
 * Analyzes an array of exercise log data and returns an array of objects containing the name of each exercise and the top sets (weight and corresponding reps) logged for each day.
 * @param {Object[]} data - An array of exercise log data, each containing an exercise name, a weight string, a rep string, and a date string.
 * @returns {Object[]} An array of objects containing the name of each exercise and the top sets (weight and corresponding reps) logged for each day.
 * Each object has the following properties:
 * exerciseName (string): The name of the exercise.
 * topSets (Object[]): An array of objects, each containing the date, top weight, and corresponding reps for that day.
 */
function getDailyTopSets(data) {
  // create an empty object to store exercises and their top sets
  const exercises = {};
  // create an empty array to store the final result
  const result = [];

  // loop through each item in the data array
  data.forEach((item) => {
    // get the name of the exercise from the item
    const { exerciseName } = item.exercise;
    // split the weight string and the rep string into arrays and convert each value to a number
    const weightArray = separateString(item.weight, "/");
    const repArray = separateString(item.rep, "/");
    // get the maximum value from the weight array
    const weight = getMaxValue(weightArray);
    // get the corresponding number of reps for the top weight
    const rep = repArray[weightArray.indexOf(weight)];

    // create an object to store the top weight and the corresponding number of reps
    const data = {
      weight: weight,
      rep: rep,
    };

    // check if the exercises object already has an entry for this exercise
    if (!exercises[exerciseName]) {
      // if not, create a new object for this exercise
      exercises[exerciseName] = {};
    }

    // get the date of the log from the item
    const date = item.logDate;
    // check if the exercises object already has an entry for this exercise on this date
    if (!exercises[exerciseName][date]) {
      // if not, add the data as the top set for this exercise on this date
      exercises[exerciseName][date] = data;
    } else if (weight > exercises[exerciseName][date].weight) {
      // if there is already a top set for this exercise on this date,
      // update it if the current weight is higher
      exercises[exerciseName][date] = data;
    }
  });

  // loop through each exercise in the exercises object
  for (const exerciseName in exercises) {
    // get the top sets for this exercise on each date
    const topSets = Object.entries(exercises[exerciseName]).map(
      ([date, data]) => ({ date, weight: data.weight, rep: data.rep })
    );
    // add this exercise and its top sets to the result array
    result.push({ exerciseName, topSets });
  }

  // return the final result array
  return result;
}
/*
 * This function calculates statistics for a set of exercise logs
 * It takes an array of exercise logs as input
 * It returns an object containing statistics for each exercise in the logs
 * Each property in the returned object is the name of an exercise
 * The value of each property is an object containing the following properties:
 * totalSets (number): The total number of sets for the exercise
 * totalReps (number): The total number of reps for the exercise
 * totalWeight (number): The total weight lifted for the exercise
 * avgSets (number): The average number of sets for the exercise
 * avgReps (number): The average number of reps for the exercise
 * avgWeight (number): The average weight lifted for the exercise
 * maxSets (number): The maximum number of sets for the exercise
 * maxReps (number): The maximum number of reps for the exercise
 * maxWeight (number): The maximum weight lifted for the exercise
 * minSets (number): The minimum number of sets for the exercise
 * minReps (number): The minimum number of reps for the exercise
 * minWeight (number): The minimum weight lifted for the exercise
 * @param {Object[]} exerciseLogs - An array of exercise logs
 * @returns {Object} An object containing statistics for each exercise in the logs
 */
function calculateExerciseStats(exerciseLogs) {
  // Initialize an empty object to store exercise statistics
  const exerciseStats = {};

  // Loop through each exercise log in the input array
  exerciseLogs.forEach((log) => {
    // Get the name of the current exercise
    const exerciseName = log.exercise.exerciseName;
    // Get the number of sets for the current exercise log
    const sets = log.set;
    // Calculate the total number of reps for the current exercise log
    const reps = log.rep
      .split("/")
      .reduce((total, current) => total + parseInt(current), 0);
    // Calculate the total weight lifted for the current exercise log
    const weight = log.weight
      .split("/")
      .reduce((total, current) => total + parseInt(current), 0);

    // If the current exercise has not been seen before, create a new entry in the exerciseStats object
    if (!exerciseStats[exerciseName]) {
      exerciseStats[exerciseName] = {
        totalSets: 0,
        totalReps: 0,
        totalWeight: 0,
        frequency: 1,
      };
    }
    // If the current exercise has been seen before, increment its frequency count
    else {
      exerciseStats[exerciseName].frequency += 1;
    }

    // Add the current exercise log's sets, reps, and weight to the exerciseStats object
    exerciseStats[exerciseName].totalSets += sets;
    exerciseStats[exerciseName].totalReps += reps;
    exerciseStats[exerciseName].totalWeight += weight;
  });

  // Return the exerciseStats object
  return exerciseStats;
}

//Export fetch data function
export {
  fetchData,
  analyzeLogDataByDate,
  getDailyTopSets,
  countExercisesPerWeek,
  getExerciseFrequency,
  calculateExerciseStats,
};

//Date picker html, start and end date
