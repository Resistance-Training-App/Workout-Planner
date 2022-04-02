//
//  PreviousExerciseTests.swift
//  WatchWorkoutPlannerTests
//

import XCTest
@testable import WatchWorkoutPlanner_Extension

class PreviousExerciseTests: XCTestCase {

    var coreDataStack: CoreDataStack!

    var exercise_1: Exercise!
    var exercise_2: Exercise!
    
    var workout: Workout!
    
    var workoutManager: WorkoutManager!
    var motionManager: MotionManager!

    override func setUpWithError() throws {
        try super.setUpWithError()

        coreDataStack = TestCoreDataStack()

        exercise_1 = Exercise.init(context: coreDataStack.testContext)
        exercise_1.order = 0
        exercise_1.name = "Bicep Curl"
        exercise_1.repTime = 3
        exercise_1.desc = "Bicep curl description."
        exercise_1.tutorial = "https://www.youtube.com/watch?v=ykJmrZ5v0Oo"
        exercise_1.isFavourite = false
        exercise_1.isHold = false
        exercise_1.userCreated = false
        exercise_1.picture = Data.init()
        exercise_1.category = Category.upperBody.rawValue
        exercise_1.equipment = Equipment.dumbbells.rawValue
        exercise_1.weight = NSSet.init(array: [Weight.init(context: coreDataStack.testContext),
                                               Weight.init(context: coreDataStack.testContext)])
        exercise_1.reps = NSSet.init(array: [Reps.init(context: coreDataStack.testContext),
                                             Reps.init(context: coreDataStack.testContext)])
        
        exercise_2 = Exercise.init(context: coreDataStack.testContext)
        exercise_2.order = 0
        exercise_2.name = "Shoulder Press"
        exercise_2.repTime = 3
        exercise_2.desc = "Shoulder press description."
        exercise_2.tutorial = "https://www.youtube.com/watch?v=ykJmrZ5v0Oo"
        exercise_2.isFavourite = false
        exercise_2.isHold = false
        exercise_2.userCreated = false
        exercise_2.picture = Data.init()
        exercise_2.category = Category.upperBody.rawValue
        exercise_2.equipment = Equipment.dumbbells.rawValue
        exercise_2.weight = NSSet.init(array: [Weight.init(context: coreDataStack.testContext),
                                               Weight.init(context: coreDataStack.testContext)])
        exercise_2.reps = NSSet.init(array: [Reps.init(context: coreDataStack.testContext),
                                             Reps.init(context: coreDataStack.testContext)])
        
        workout = Workout.init(context: coreDataStack.testContext)
        workout.category = Category.upperBody.rawValue
        workout.coolDown = StretchLength.none.rawValue
        workout.id = UUID()
        workout.isCopy = false
        workout.isFavourite = false
        workout.name = "TestWorkout"
        workout.sets = 1
        workout.time = 0.0
        workout.timeCreated = Date.distantPast
        workout.warmUp = StretchLength.none.rawValue
        workout.exercises = NSSet.init(array: [exercise_1!, exercise_2!])
        workout.stretches = NSSet.init()
        
        workoutManager = WorkoutManager.init()
        workoutManager.myWorkout = workout
        workoutManager.currentExercise = 1
        workoutManager.currentExerciseSet = 1
        
        motionManager = MotionManager.init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        coreDataStack = nil
        exercise_1 = nil
        exercise_2 = nil
        workout = nil
        workoutManager = nil
        motionManager = nil
    }

    func testPreviousExercise() throws {
        previousExercise(workout: workoutManager, motion: motionManager, countdownTime: 0)

        XCTAssertTrue(workoutManager.currentExercise == 1)
        XCTAssertTrue(workoutManager.currentExerciseSet == 0)
        XCTAssertFalse(motionManager.isRunning)
        
        previousExercise(workout: workoutManager, motion: motionManager, countdownTime: 0)

        XCTAssertTrue(workoutManager.currentExercise == 0)
        XCTAssertTrue(workoutManager.currentExerciseSet == 1)
        XCTAssertFalse(motionManager.isRunning)
        
        previousExercise(workout: workoutManager, motion: motionManager, countdownTime: 0)

        XCTAssertTrue(workoutManager.currentExercise == 0)
        XCTAssertTrue(workoutManager.currentExerciseSet == 0)
        XCTAssertFalse(motionManager.isRunning)
    }
}
