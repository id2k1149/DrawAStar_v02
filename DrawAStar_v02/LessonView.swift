//
//  LessonView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct LessonView: View {
    @State private var currentStep = Step.start
    @State private var progress: Double = 0
    
    var body: some View {
       
        VStack {
            Text("How to Draw a Star")
                .font(.largeTitle)
                .bold()
                .padding()
            
            ButtonView(currentStep: $currentStep,
                       progress: $progress)
            .padding(.bottom)
            
            StepView(currentStep: $currentStep,
                     progress: $progress)
            
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
    }
}
