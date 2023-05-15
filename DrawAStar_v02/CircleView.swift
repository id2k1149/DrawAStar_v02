//
//  CircleView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/12/23.
//

import SwiftUI

struct CircleView: View {
    @Binding var progress: Double
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        
        ZStack {
//            Circle()
//                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                
            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1.0)))
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear(duration: 3), value: progress)
                
            Text(progress.formatted())
                .font(.largeTitle)
                .bold()
                .offset(x: diameter / 4)
        }
        .frame(width: diameter,
           height: diameter)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(progress: .constant(1))
    }
}
