//
//  StepTwoView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct StepTwoView: View {
    @Binding var progress: [Double]
    @State private var isAnimationComplete = false
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: diameter / 2, y: diameter / 2))
                path.addLine(to: CGPoint(x: diameter / 2, y: -10))
            }
            .trim(from: 0.0, to: CGFloat(min(self.progress[2], 1.0)))
            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            .animation(.linear(duration: 2), value: progress[2])
 
        }
        .frame(width: diameter, height: diameter)
    }
}


struct StepTwoView_Previews: PreviewProvider {
    static var previews: some View {
        StepTwoView(progress: .constant([0, 0, 1, 0, 0]))
    }
}
