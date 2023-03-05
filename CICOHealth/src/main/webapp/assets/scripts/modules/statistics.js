/**
 * Fetch statistics data from server
 * @param {String} type Type of data to fetch
 * @param {Date string} startDate Start date of statistics period
 * @param {Date string} endDate End date of statistics period
 * @returns {Object} Data object
 * Object structure:
 * - nutrition: {Object} Nutrition data
 *   {cardioLogs:[Object array], mealLogs:[Object array]}
 *   The cardio logs will contain date, duration, and calories burned
 *   The meal logs will contain date and nutrition data: calories, protein, carbs, fat
 * - exercise (resistance and cardio): {Object} Exercise data
 *   {logs:[ExerciseLog Object array]}
 * - healthInfo: {Object} Health info data
 * @throws {Error} If type is invalid
 *
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
/*----------------Nutrition Statistics-----------------------*/
function calculateNutritionStatistics(data) {
  let dailyStats = {};

  data.cardioLogs.forEach((log) => {
    if (!dailyStats[log.logDate]) {
      dailyStats[log.logDate] = {
        date: log.logDate,
        caloriesBurnt: 0,
        caloriesConsumed: 0,
        proteinConsumed: 0,
        fatConsumed: 0,
        carbsConsumed: 0,
        netCalories: 0,
      };
    }
    dailyStats[log.logDate].caloriesBurnt += log.caloriesBurnt;
  });

  data.mealLogs.forEach((log) => {
    if (!dailyStats[log.logDate]) {
      dailyStats[log.logDate] = {
        date: log.logDate,
        caloriesBurnt: 0,
        caloriesConsumed: 0,
        proteinConsumed: 0,
        fatConsumed: 0,
        carbsConsumed: 0,
        netCalories: 0,
      };
    }
    dailyStats[log.logDate].caloriesConsumed += log.nutrition[3];
    dailyStats[log.logDate].proteinConsumed += log.nutrition[0];
    dailyStats[log.logDate].fatConsumed += log.nutrition[1];
    dailyStats[log.logDate].carbsConsumed += log.nutrition[2];
  });

  for (const date in dailyStats) {
    const netCalories =
      dailyStats[date].caloriesConsumed - dailyStats[date].caloriesBurnt;
    dailyStats[date].netCalories = netCalories;
  }

  return Object.values(dailyStats);
  // const result = {};

  // // Calculate daily calories burnt from exercise
  // data.cardioLogs.forEach((log) => {
  //   const date = log.logDate;
  //   const caloriesBurnt = log.caloriesBurnt;
  //   if (!result[date]) {
  //     result[date] = {
  //       caloriesBurnt: 0,
  //       caloriesConsumed: 0,
  //       proteinConsumed: 0,
  //       fatConsumed: 0,
  //       carbsConsumed: 0,
  //     };
  //   }
  //   result[date].caloriesBurnt += caloriesBurnt;
  // });

  // // Calculate daily calories consumed and macronutrients consumed
  // data.mealLogs.forEach((log) => {
  //   const date = log.logDate;
  //   const nutrition = log.nutrition;
  //   if (!result[date]) {
  //     result[date] = {
  //       caloriesBurnt: 0,
  //       caloriesConsumed: 0,
  //       proteinConsumed: 0,
  //       fatConsumed: 0,
  //       carbsConsumed: 0,
  //     };
  //   }
  //   result[date].caloriesConsumed += nutrition[3];
  //   result[date].proteinConsumed += nutrition[0];
  //   result[date].fatConsumed += nutrition[1];
  //   result[date].carbsConsumed += nutrition[2];
  // });

  // return result;
}

//----------------------------------------------------------------------------------------------
/*----------------Exercise statistics-----------------------*/
//----------------Utility functions

/**
 * This function returns the start and end dates for a given week in a given year.
 * @param {number} year - The year for the week
 * @param {number} weekNumber - The week number (1-52)
 * @returns {Object} An object containing the start and end dates for the week
 */
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

/**
 * This function returns the week number (1-52) for a given date.
 * @param {Date} date - The date to get the week number for
 * @returns {number} The week number (1-52)
 */
function getWeekNumber(date) {
  const onejan = new Date(date.getFullYear(), 0, 1);
  const millisecsInDay = 86400000;
  return Math.ceil(
    ((date - onejan) / millisecsInDay + onejan.getDay() + 1) / 7
  );
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
//----------------------------------------------------------------------------------------------
//----------------Main functions
//----------------Resistence exercise statistics

/**
 * This function counts the number of times each exercise is performed in a given week across all years
 * It takes an array of exercise logs as input and returns an object containing the count for each exercise
 * for each week in every year. Each property in the returned object is a year, and each year property
 * contains a week object, which contains the count for each exercise.
 * @param {Object[]} data - An array of exercise logs
 * @returns {Object} An object containing the count of each exercise for each week in every year
 */
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

/**
 * This function calculates the frequency of a given exercise across all weeks in all years
 * It takes an exercise name and an array of exercise logs as input and returns an object containing the name
 * of the exercise, the total number of times it was performed, and an array of objects containing the count for
 * each week the exercise was performed, as well as the start and end dates of the week.
 * @param {string} exerciseName - The name of the exercise to calculate the frequency for
 * @param {Object[]} data - An array of exercise logs
 * @returns {Object} An object containing the name of the exercise, the total number of times it was performed,
 * and an array of objects containing the count for each week the exercise was performed, as well as the start and
 * end dates of the week.
 */
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
 * It takes an array of exercise logs as input and returns an object containing statistics
 * for each exercise in the logs. Each property in the returned object is the name of an exercise
 * The value of each property is an object containing the following properties:
 * - totalSets (number): The total number of sets for the exercise
 * - totalReps (number): The total number of reps for the exercise
 * - totalWeight (number): The total weight lifted for the exercise
 * - frequency (number): The number of times the exercise was performed
 * - averageSets (number): The average number of sets for the exercise
 * - averageReps (number): The average number of reps for the exercise
 * - averageWeight (number): The average weight lifted for the exercise
 * - maxWeight (number): The maximum weight lifted for the exercise
 * @param {Object[]} exerciseLogs - An array of exercise logs
 * @returns {Object} An object containing statistics for each exercise in the logs
 */
function calculateResistanceExerciseStats(exerciseLogs) {
  console.log(exerciseLogs);
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
        maxWeight: getMaxValue(separateString(log.weight, "/")),
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
    exerciseStats[exerciseName].maxWeight = getMaxValue([
      exerciseStats[exerciseName].maxWeight,
      ...separateString(log.weight, "/"),
    ]);
  });
  //Add average weight and average reps to the exerciseStats object
  for (const exercise in exerciseStats) {
    exerciseStats[exercise].averageWeight =
      exerciseStats[exercise].totalWeight / exerciseStats[exercise].totalSets;
    exerciseStats[exercise].averageReps =
      exerciseStats[exercise].totalReps / exerciseStats[exercise].totalSets;
    // exercise[exercise].averageSets = exerciseStats[exercise].totalSets / exerciseStats[exercise].frequency;
  }

  // Return the exerciseStats object
  return exerciseStats;
}
//----------------Cardio exercise statistics
function calculateDailyCardioStats(exerciseLogs) {
  const cardioLogs = exerciseLogs.filter((log) => {
    const exercise = log.exercise;
    return exercise && exercise.caloriesPerHour > 0;
  });

  const cardioStats = {};
  cardioLogs.forEach((log) => {
    const logDate = log.logDate;
    const timeSpent = log.timeSpent;
    const caloriesBurnt = (log.exercise.caloriesPerHour * timeSpent) / 60;
    const exerciseName = log.exercise.exerciseName;

    if (cardioStats[logDate]) {
      cardioStats[logDate].timeSpent += timeSpent;
      cardioStats[logDate].caloriesBurnt += caloriesBurnt;
      cardioStats[logDate].exerciseNames.push(exerciseName);
    } else {
      cardioStats[logDate] = {
        timeSpent,
        caloriesBurnt,
        exerciseNames: [exerciseName],
      };
    }
  });

  return cardioStats;
}

/**
 * This function calculates statistics for a set of exercise logs
 * It takes an array of exercise logs as input and returns an array of objects containing statistics
 * for each unique exercise in the logs.
 * Each object in the returned array contains the following properties:
 * - exerciseName (string): The name of the exercise
 * - totalTimeSpent (number): The total time spent on the exercise, in minutes
 * - totalKcalBurnt (number): The total number of calories burnt during the exercise
 * - frequency (number): The number of times the exercise was performed
 * - averageTimeSpent (number): The average time spent on the exercise, in minutes
 * - averageKcalBurnt (number): The average number of calories burnt during the exercise
 * - maxTimeSpent (number): The maximum time spent on the exercise, in minutes (per log that is)
 * - maxKcalBurnt (number): The maximum number of calories burnt during the exercise (same as max time spent)
 * @param {Object[]} exerciseLogs - An array of exercise logs
 * @returns {Object[]} An array of objects containing statistics for each unique exercise in the logs
 */
function calculateCardioExerciseStats(exerciseLogs) {
  // Create an object to store information for each exercise
  const exercises = {};

  // Loop through each exercise log
  exerciseLogs.forEach((log) => {
    const exerciseName = log.exercise.exerciseName;
    const timeSpent = log.timeSpent;
    const caloriesBurned = (log.exercise.caloriesPerHour / 60) * timeSpent; // Calculate calories burned

    // If exercise hasn't been encountered before, initialize its info
    if (!exercises[exerciseName]) {
      exercises[exerciseName] = {
        exerciseName: exerciseName,
        totalTimeSpent: 0,
        totalKcalBurnt: 0,
        frequency: 0,
        maxTimeSpent: timeSpent,
        maxKcalBurnt: caloriesBurned,
      };
    }

    // Update exercise info
    exercises[exerciseName].totalTimeSpent += timeSpent;
    exercises[exerciseName].totalKcalBurnt += caloriesBurned;
    exercises[exerciseName].frequency++;
    exercises[exerciseName].averageTimeSpent =
      exercises[exerciseName].totalTimeSpent /
      exercises[exerciseName].frequency;
    exercises[exerciseName].averageKcalBurnt =
      exercises[exerciseName].totalKcalBurnt /
      exercises[exerciseName].frequency;

    // Update max time and max kcal if necessary
    if (timeSpent > exercises[exerciseName].maxTimeSpent) {
      exercises[exerciseName].maxTimeSpent = timeSpent;
      exercises[exerciseName].maxKcalBurnt = caloriesBurned;
    }
  });

  // Return array of exercise info objects
  return Object.values(exercises);
}

//Export fetch data function
export {
  fetchData,
  analyzeLogDataByDate,
  getDailyTopSets,
  countExercisesPerWeek,
  getExerciseFrequency,
  calculateResistanceExerciseStats,
  calculateDailyCardioStats,
  calculateCardioExerciseStats,
  calculateNutritionStatistics,
};
