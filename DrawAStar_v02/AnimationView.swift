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
            CircleView(progress: $progress)
            MarkLineView(progress: $progress)
            
//            MarkView()
//                .offset(y: -diameter / 2)
//                .animation(.linear(duration: 5), value: progress[2])
            
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(currentStep: .constant(Step(rawValue: 1) ?? Step.one), progress: .constant([1]))
    }
}
