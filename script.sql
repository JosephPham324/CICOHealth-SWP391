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

INSERT [dbo].[user] ([userID], [firstName], [lastName], [email], [phone]) VALUES (N'USAD000001', N'admin', N'1', N'', N'')
GO
INSERT [dbo].[login] ([userID], [username], [passwordHash], [passwordSalt], [GoogleID], [isBanned]) VALUES (N'USAD000001', N'admin1USAD000001', N'lL0NHs30CxmM6uGby9Y8Hu2MPr86qCxxluLfoc961Wk=', N'jmvrwT&9-0"6DBJMS', N'', 0)
GO
INSERT [dbo].[healthInfo] ([userID], [healthInfoID], [createdDate], [gender], [height], [weight], [age], [activeness], [tdee], [dailyCalorie], [dailyProtein], [dailyFat], [dailyCarb]) VALUES (N'USAD000001', N'HLTH000001', CAST(N'2023-03-21T23:12:40.897' AS DateTime), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT INTO exercise(exerciseID, exerciseName, exerciseDescription, caloriesPerHour)
VALUES
  ('EXCA000001', 'Treadmill Run', 'Running on a treadmill at moderate pace', 50),
  ('EXCA000002', 'Elliptical', 'Using an elliptical machine at moderate pace', 450),
  ('EXCA000003', 'Spinning', 'Riding a stationary bike at moderate pace', 40),
  ('EXCA000004', 'Jump Rope', 'Jumping rope at moderate pace', 60),
  ('EXCA000005', 'Swimming', 'Swimming freestyle at moderate pace', 50),
  ('EXRE000001', 'Dumbbell Bench Press', 'Using dumbbells for a bench press workout', 40),
  ('EXRE000002', 'Barbell Squat', 'Using a barbell for a squat workout', 50),
  ('EXRE000003', 'Deadlift', 'Performing a deadlift workout', 550),
  ('EXRE000004', 'Dumbbell Row', 'Using dumbbells for a row workout', 450),
  ('EXRE000005', 'Pull-ups', 'Performing pull-ups', 40),
  ('EXRE000006', 'Push-ups', 'Performing push-ups', 20),
  ('EXRE000007', 'Lunges', 'Performing lunges', 30),
  ('EXRE000008', 'Bicep Curls', 'Using dumbbells for bicep curls', 20),
  ('EXRE000009', 'Tricep Dips', 'Performing tricep dips', 250),
  ('EXRE000010', 'Plank', 'Holding a plank position', 10),
  ('EXCA000006', 'Walking', 'Walking at moderate pace', 300),
  ('EXCA000007', 'Yoga', 'Practicing yoga', NULL),
  ('EXRE000011', 'Meditation', 'Meditating', NULL),
  ('EXRE000012', 'Stretching', 'Stretching exercises', NULL),
  ('EXCA000008', 'Cycling', 'Riding a bicycle at moderate pace', 40),
  ('EXCA000009', 'Rowing', 'Using a rowing machine at moderate pace', 50),
  ('EXCA000010', 'Jump Squats', 'Performing jump squats', 70),
  ('EXRE000013', 'Barbell Curls', 'Using a barbell for bicep curls', 250),
  ('EXRE000014', 'Tricep Extensions', 'Using dumbbells for tricep extensions', 20),
  ('EXRE000015', 'Calf Raises', 'Performing calf raises', 20),
  ('EXRE000016', 'Leg Press', 'Using a leg press machine', 550),
  ('EXRE000017', 'Leg Extensions', 'Using a leg extension machine', 30),
  ('EXRE000018', 'Hammer Curls', 'Using dumbbells for hammer curls', 20),
  ('EXRE000019', 'Side Plank', 'Holding a side plank position', 10),
  ('EXCA000011', 'Hiking', 'Going for a hike', 450),
  ('EXCA000012', 'Kickboxing', 'Practicing kickboxing', 60),
  ('EXCA000013', 'Boxing', 'Practicing boxing', 70),
  ('EXCA000014', 'Dancing', 'Dancing at moderate pace', 50),
  ('EXRE000020', 'Barbell Deadlifts', 'Using a barbell for a deadlift workout', 60),
  ('EXRE000021', 'Barbell Row', 'Using a barbell for a row workout', 50),
  ('EXRE000022', 'Chin-ups', 'Performing chin-ups', 40),
  ('EXRE000023', 'Dips', 'Performing dips', 250),
  ('EXRE000024', 'Step-ups', 'Performing step-ups', 30),
  ('EXCA000015', 'Jogging', 'Jogging at moderate pace', 450),
  ('EXCA000016', 'Skipping', 'Skipping at moderate pace', 60),
  ('EXCA000017', 'Squat Jumps', 'Performing squat jumps', 70),
  ('EXRE000025', 'Barbell Overhead Press', 'Using a barbell for an overhead press workout', 40),
  ('EXRE000026', 'Lateral Raises', 'Using dumbbells for lateral raises', 20),
  ('EXRE000027', 'Upright Rows', 'Using dumbbells for upright rows', 250),
  ('EXRE000028', 'Barbell Shrugs', 'Using a barbell for shrugs', 20),
  ('EXRE000029', 'Leg Lifts', 'Performing leg lifts', 30),
  ('EXRE000030', 'Seated Calf Raises', 'Using a calf raise machine', 20),
  ('EXRE000031', 'Barbell Squats', 'Using a barbell for a squat workout', 60),
  ('EXCA000018', 'Rope Skipping', 'Skipping rope at moderate pace', 70),
  ('EXCA000019', 'Rollerblading', 'Rollerblading at moderate pace', 40),
  ('EXCA000020', 'Skateboarding', 'Skateboarding at moderate pace', 450),
  ('EXCA000021', 'Surfing', 'Surfing at moderate pace', 50),
  ('EXRE000032', 'Barbell Bicep Curls', 'Using a barbell for bicep curls', 250),
  ('EXRE000033', 'Tricep Kickbacks', 'Using dumbbells for tricep kickbacks', 20),
  ('EXRE000034', 'Leg Abduction', 'Using a leg abduction machine', 30),
  ('EXRE000035', 'Seated Leg Press', 'Using a seated leg press machine', 550),
  ('EXRE000036', 'Barbell Lunges', 'Using a barbell for lunges', 30);
GO