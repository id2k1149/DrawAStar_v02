//
//  StepThreeView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/15/23.
//

import SwiftUI

struct StepThreeView: View {
    @Binding var progress: [Double]
    @Binding var currentStep: Step
    @Binding var points: Int
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let angle = 360 / points
        
        ZStack {
            Text("\(angle)º")
                .font(.title3)
                .offset(x: progress[3] == 0 ? -diameter : diameter / 18,
                        y: -diameter / 10)
                .animation(.linear(duration: 1), value: progress[3])
            
            ForEach(0..<points, id: \.self) { iteration in
                ZStack {
                    Path { path in
                        path.move(to: CGPoint(x: diameter / 2, y: diameter / 2))
                        path.addLine(to: CGPoint(x: diameter / 2, y: -10))
                    }
                    .trim(from: 0.0, to: CGFloat(min(self.progress[3], 1.0)))
                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                    .animation(.linear(duration: 0.5), value: progress[3])
                    
                    if currentStep.rawValue == 3 || currentStep.rawValue == 4 {
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.gray.opacity(0.9))
                            .offset(y: -diameter/2)
                    }
                        
                }
                .frame(width: diameter, height: diameter)
                .rotationEffect(.degrees(Double(iteration * angle)))
            }
        }
    }
}

struct StepThreeView_Previews: PreviewProvider {
    static var previews: some View {
        StepThreeView(progress: .constant([0, 0, 0, 1, 0, 0]),
                      currentStep: .constant(.three),
                      points: .constant(5))
    }
}
