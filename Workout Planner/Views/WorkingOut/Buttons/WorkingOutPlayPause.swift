//
//  WorkingOutPlayPause.swift
//  Workout Planner
//
//  Play/pause button to stop and start the timer and the countdown if the current exercise is a
//  hold
//

import SwiftUI

struct WorkingOutPlayPause: View {
    
    @EnvironmentObject var workout: WorkoutManager
    
    var body: some View {
        ZStack {

            // Pause button.
            if (workout.mode == .running) {
                Button {
                    workout.pause()
                    if (workout.myWorkout.exerciseArray[workout.currentExercise].isHold) {
                        if (workout.preCountdown.mode == .running) {
                            workout.preCountdown.pause()
                        } else if (workout.countdown.mode == .running) {
                            workout.countdown.pause()
                        }
                    }
                } label: {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.orange)

            // Play button.
            } else if (workout.mode == .paused) {
                Button {
                    workout.resume()
                    if (workout.myWorkout.exerciseArray[workout.currentExercise].isHold) {
                        if (workout.preCountdown.mode == .paused) {
                            workout.preCountdown.restart(secondsElapsed: workout.preCountdown.secondsElapsed)
                        } else if (workout.countdown.mode == .paused) {
                            workout.countdown.restart(secondsElapsed: workout.countdown.secondsElapsed)
                        }
                    }
                } label: {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.orange)
            }
        }
    }
}
