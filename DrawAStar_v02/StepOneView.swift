//
//  StepOneView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/12/23.
//

import SwiftUI

struct StepOneView: View {
    @Binding var progress: [Double]
    @Binding var currentStep: Step
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(min(progress[1], 1.0)))
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear(duration: 5), value: progress[1])
            
            if currentStep.rawValue == 1 || currentStep.rawValue == 2 {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray.opacity(0.9))
            }
                
        }
        .frame(width: diameter,
           height: diameter)
    }
}

struct StepOneView_Previews: PreviewProvider {
    static var previews: some View {
        StepOneView(progress: .constant([0, 1, 0, 0, 0, 0]),
                    currentStep: .constant(.one))
    }
}
