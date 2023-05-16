//
//  AnimationView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/15/23.
//

import SwiftUI

struct AnimationView: View {
    @Binding var currentStep: Step
    @Binding var progress: [Double]
    
    var body: some View {
        ZStack {
            StepOneView(progress: $progress)
            StepTwoView(progress: $progress)
            StepThreeView(progress: $progress, points: .constant(5))
            

            
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(currentStep: .constant(Step(rawValue: 1) ?? Step.one), progress: .constant([1]))
    }
}
