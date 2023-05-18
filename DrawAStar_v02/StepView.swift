//
//  StepView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct StepView: View {
    @Binding var points: Int
    @Binding var currentStep: Step
    @Binding var progress: [Double]
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let stepViewHeight = UIScreen.main.bounds.height * 0.7
        
        VStack(alignment: .leading)  {
            ZStack {
                
                if currentStep.rawValue == 0 {
                    StartView()
//                        .offset(x: currentStep.rawValue == 0 ? 0 : -diameter)
                }
                
                AnimationView(points: $points,
                              currentStep: $currentStep,
                              progress: $progress)
                
                if currentStep.rawValue == 5 {
                    StarView(points: $points, isSimple: true)
                }
                
            }
            .frame(width: diameter,
                   height: diameter)

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
    case five = 5
    
    var instructions: String {
        switch self {
        case .start:
            return "You will need the following equipment.\n - a graphite pencil \n - a pair of compasses \n - a ruler \n - an eraser \n - drawing paper"
        case .one:
            return "Learn how to draw a star the easy way. Just mark the central point with a pencil, and then draw a relatively big circle of an arbitrary radius, using the compass."
        case .two:
            return "Add a vertical line that is going from the central point of the circle."
        case .three:
            return "Let’s find the first sector with a protractor. Then add more lines. Now we have a few sectors; the points where the lines cross the circumference will be the apexes of our star."
        case .four:
            return "Connect all the points with a straight line. The shape is complete!"
        case .five:
            return "Outline the contours of the star, and then erase the unnecessary captions."
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(points: .constant(5),
                 currentStep: .constant(Step(rawValue: 0) ?? Step.start),
                 progress: .constant([0]))
    }
}
