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
            
            HStack {
                Text("\(lround(progress[0]))")
                Text("\(lround(progress[1]))")
                Text("\(lround(progress[2]))")
                Text("\(lround(progress[3]))")
                Text("\(lround(progress[4]))")
            }
        }
    }
    
    private func buttonAction() {
        withAnimation {
            progress[currentStep.rawValue] += 1.0
            currentStep = Step(rawValue: currentStep.rawValue + 1) ?? Step.start
            if currentStep.rawValue == 0 {
                progress = [0.0, 0.0, 0.0, 0.0, 0.0]
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(currentStep: .constant(Step.start),
                   progress: .constant([0]))
    }
}
