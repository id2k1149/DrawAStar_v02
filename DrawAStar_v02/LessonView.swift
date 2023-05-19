//
//  LessonView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct LessonView: View {
    @State private var points: Int = 5
    @State private var currentStep = Step.start
    @State private var progress: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    
    var body: some View {
        VStack {
            Text("How to Draw a Star")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                
            StepView(points: $points,
                     currentStep: $currentStep,
                     progress: $progress)
            
            ButtonView(currentStep: $currentStep,
                       progress: $progress)
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
    }
}
