//
//  StepView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct StepView: View {
    @Binding var currentStep: Step
    @Binding var progress: Double
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let stepViewHeight = UIScreen.main.bounds.height * 0.7
        
        VStack(alignment: .leading)  {
            ZStack {
               
                StartView()
                    .offset(x: currentStep.rawValue == 0 ? 0 : -diameter)
                    
                AnimationView(currentStep: $currentStep,
                              progress: $progress)
                
                
            }
            .background(.orange)
            .frame(width: diameter,
                   height: diameter)
            
//            Text(currentStep.rawValue.formatted())
//            Text(progress.formatted())
            

            
            
        
            VStack(alignment: .leading)  {
                if currentStep.rawValue == 0 {
                    Text("What You Will Need")
                        .font(.largeTitle)
                        .bold()
                } else {
                    Text("Step \(currentStep.rawValue)")
                        .font(.largeTitle)
                        .bold()
                }
                Text(currentStep.instructions)
            }
            .background(.orange)
            .frame(width: diameter,
                   height: diameter / 2)
        }
        .frame(width: diameter,
               height: stepViewHeight)
        
    }
}

enum Step: Int, CaseIterable {
    case start = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    
    var instructions: String {
        switch self {
        case .start:
            return "You will need the following equipment.\n - a graphite pencil \n - a pair of compasses \n - a ruler \n - an eraser \n - drawing paper"
        case .one:
            return "Draw a relatively big circle"
        case .two:
            return "Add a vertical line."
        case .three:
            return "Add more lines."
        case .four:
            return "Connect all the points"
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(currentStep: .constant(Step(rawValue: 0) ?? Step.start),
                 progress: .constant(0))
    }
}
