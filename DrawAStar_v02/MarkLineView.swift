//
//  MarkLineView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/14/23.
//

import SwiftUI

struct MarkLineView: View {
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
            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
            .animation(.linear(duration: 3), value: progress[2])
            .onChange(of: progress) { newValue in
                if newValue[2] == 1.0 {
                    isAnimationComplete = true
                }
            }
            
            if isAnimationComplete {
                MarkView()
                MarkView()
                    .offset(y: -diameter / 2)
            }
        }
        .frame(width: diameter, height: diameter)
    }
}


struct MarkLineView_Previews: PreviewProvider {
    static var previews: some View {
        MarkLineView(progress: .constant([0, 0, 1, 0, 0]))
    }
}
