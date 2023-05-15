//
//  LessonView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct LessonView: View {
//    @State private var currentStep = Step.start
    @State private var currentStep = Step.one
    @State private var progress: Double = 0
    
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        
        VStack {
            Text("How to Draw a Star")
                .font(.largeTitle)
                .bold()
                .padding()
            
            ButtonView(currentStep: $currentStep,
                       progress: $progress)
                .padding(.bottom)
            
            ZStack {
                if currentStep.rawValue > 0 {
                    CircleView(progress: $progress)
                    

                }
                if currentStep.rawValue > 2 {
                    MarkLineView(progress: $progress)
                }
                if currentStep.rawValue > 3 {
                    ForEach(0..<5, id: \.self) { iteration in
                        MarkLineView(progress: $progress)
//                            .offset(y: -diameter / 2)
                            .rotationEffect(.degrees(Double(iteration) * 360 / 5))
                    }
                    ForEach(0..<5, id: \.self) { iteration in
                        MarkView()
                            .offset(y: -diameter / 2)
                            .rotationEffect(.degrees(Double(iteration) * 360 / 5))
                    }
                }
            }
            .frame(width: diameter,
                   height: diameter)
            
            
            ZStack {
                StepView(currentStep: $currentStep)
            }
            .frame(width: diameter, height: 150)
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
    }
}
