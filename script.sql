USE master
DROP DATABASE IF EXISTS  CICOHealth;

CREATE DATABASE CICOHealth;

USE CICOHealth;

CREATE TABLE [user] (
    userID varchar(10) PRIMARY KEY NOT NULL,
    firstName nvarchar(255) NOT NULL,
    lastName nvarchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(10) NOT NULL
);

CREATE TABLE login (
    userID varchar(10) PRIMARY KEY NOT NULL REFERENCES [user](userID),
    username varchar(255) NOT NULL UNIQUE,
    passwordHash varchar(255) NOT NULL,
    passwordSalt varchar(255) NOT NULL,
    GoogleID varchar(30) NULL,
    isBanned bit NOT NULL
);

CREATE TABLE healthInfo (
    userID varchar(10) NOT NULL REFERENCES [user](userID),
	healthInfoID varchar(10) PRIMARY KEY,
	createdDate datetime NULL,
    gender bit NOT NULL,
    height float NOT NULL,
    weight float NOT NULL,
    age int NOT NULL,
    activeness int NOT NULL,
    tdee int NOT NULL,
    dailyCalorie float NOT NULL,
    dailyProtein float NOT NULL,
    dailyFat float NOT NULL,
    dailyCarb float NOT NULL
);

CREATE TABLE question (
    questionID varchar(10) PRIMARY KEY NOT NULL,
    submittedBy varchar(10) NULL,
    questionTopic varchar(255) NOT NULL,
    questionContent varchar(1000) NOT NULL
);

CREATE TABLE answer (
    answerID varchar(10) PRIMARY KEY NOT NULL,
    createdBy varchar(10) NOT NULL REFERENCES [user](userID),
    questionTopic varchar(255) NOT NULL,
    questionContent varchar(1000) NOT NULL,
	answerContent varchar(1000) NOT NULL
);

CREATE TABLE mealLog (
    userID varchar(10) NOT NULL REFERENCES [user](userID),
    mealLogID varchar(10) PRIMARY KEY NOT NULL,
    mealLogName varchar(255) NOT NULL,
    logTime time NOT NULL,
    logDate date NOT NULL,
    logNote text NOT NULL
);

CREATE TABLE mealLogItem (
    mealLogID varchar(10)  NOT NULL REFERENCES mealLog(mealLogID) ON DELETE CASCADE,
    itemID varchar(10) PRIMARY KEY NOT NULL,
    itemName varchar(255) NOT NULL,
    servingWeight float NOT NULL,
    proteinPerServing float NOT NULL,
    fatPerServing float NOT NULL,
    carbPerServing float NOT NULL,
    caloriePerServing float NOT NULL,
	actualWeight float NOT NULL
);

CREATE TABLE exercise (
  exerciseID varchar(10) NOT NULL,
  exerciseName varchar(255) NOT NULL,
  exerciseDescription text NOT NULL,
  caloriesPerHour float NULL,
  PRIMARY KEY (exerciseID)
);

CREATE TABLE ExerciseLog (
  userID varchar(10) NOT NULL,
  exerciseLogID varchar(10) NOT NULL,
  exerciseID varchar(10) NOT NULL,
  logTime time NOT NULL,
  logDate date NOT NULL,
  [set] int,
  rep varchar(255),
  weight varchar(255),
  timeSpent int,
  logNote text,
  PRIMARY KEY (exerciseLogID),
  FOREIGN KEY (userID) REFERENCES [user](userID),
  FOREIGN KEY (exerciseID) REFERENCES [exercise](exerciseID)
);

CREATE TABLE ExerciseProgram (
  programID varchar(10) NOT NULL,
  createdBy varchar(10) NOT NULL,
  programName varchar(255) NOT NULL,
  programDescription text NOT NULL,
  PRIMARY KEY (programID),
  FOREIGN KEY (createdBy) REFERENCES [user](userID)
 );

CREATE TABLE Workout (
  programID varchar(10) NOT NULL,
  workoutID varchar(10) NOT NULL,
  workoutName varchar(255) NOT NULL,
  workoutDate varchar(1) NOT NULL,
  workoutDescription text NOT NULL,
  PRIMARY KEY (workoutID),
  FOREIGN KEY (programID) REFERENCES ExerciseProgram(programID) ON DELETE CASCADE
  );

CREATE TABLE WorkoutExercises (
  workoutID varchar(10) NOT NULL,
  exerciseID varchar(10) NOT NULL,
  exerciseOrder int NOT NULL,
  [set] int,
  reps text,
  weight text,
  duration int,
  calorieBurnt float,
  instruction text NOT NULL,
  PRIMARY KEY (workoutID, exerciseID),
  FOREIGN KEY (workoutID) REFERENCES workout(workoutID) ON DELETE CASCADE,
  FOREIGN KEY (exerciseID) REFERENCES exercise(exerciseID) ON DELETE CASCADE
);
CREATE TABLE ProgramInventory (
  userID varchar(10) NOT NULL REFERENCES [user](userID) ON DELETE CASCADE,
  programID varchar(10) NOT NULL REFERENCES [exerciseProgram](programID) ON DELETE CASCADE,
  PRIMARY KEY (userID, programID)
);

CREATE TABLE expertProfile (
  userID varchar(10) NOT NULL,
  profilePicture varchar(255) NOT NULL,
  bio text NOT NULL,
  PRIMARY KEY (userID),
  FOREIGN KEY (userID) REFERENCES [user](userID)
);

CREATE TABLE certification (
  userID varchar(10) NOT NULL,
  certID varchar(255) NOT NULL,
  certName text NOT NULL,
  certIssuer varchar(255) NOT NULL,
  certDate date NOT NULL,
  certPhoto varchar(255) NOT NULL,
  PRIMARY KEY (certID),
  FOREIGN KEY (userID) REFERENCES [user](userID)
);
GO

ALTER TABLE EXERCISELOG
ADD FOREIGN KEY (exerciseID) REFERENCES exercise(exerciseID); 
GO
--Trigger to add createdDate when a new healthInfo is created
CREATE TRIGGER add_created_date_health_info ON healthInfo AFTER INSERT AS
BEGIN
    UPDATE healthInfo
    SET createdDate = GETDATE()
    FROM healthInfo
    WHERE healthInfo.healthInfoID = (SELECT healthInfoID from INSERTED)
END
GO