//
//  AnimationView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/15/23.
//

import SwiftUI

struct AnimationView: View {
    @Binding var points: Int
    @Binding var currentStep: Step
    @Binding var progress: [Double]
    
    var body: some View {
        ZStack {
            StepOneView(progress: $progress,
                        currentStep: $currentStep)
            StepTwoView(progress: $progress)
            StepThreeView(progress: $progress,
                          currentStep: $currentStep,
                          points: $points)
            StepFourView(progress: $progress, points: $points)
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(points: .constant(5),
                      currentStep: .constant(Step(rawValue: 1) ?? Step.one),
                      progress: .constant([1]))
    }
}
