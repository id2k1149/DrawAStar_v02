//
//  ButtonView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/12/23.
//

import SwiftUI

struct ButtonView: View {
    @Binding var currentStep: Step
    @Binding var progress: [Double]
    
    var body: some View {
        HStack {
            Button(action: buttonAction) {
                Text(currentStep == Step.start ? "Start" : "Next step")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
            
            Text(currentStep.rawValue.formatted())
            Text(progress[currentStep.rawValue].formatted())
            
            if currentStep.rawValue > 0 {
                Text(progress[currentStep.rawValue - 1].formatted())
                
            }
            
        }
    }
    
    private func buttonAction() {
        withAnimation {
            progress[currentStep.rawValue] += 1.0
            currentStep = Step(rawValue: currentStep.rawValue + 1) ?? Step.start
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(currentStep: .constant(Step.start),
                   progress: .constant([0]))
    }
}
