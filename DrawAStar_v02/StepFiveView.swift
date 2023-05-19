//
//  StepFiveView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct StepFiveView: View {
    @Binding var progress: [Double]
    @Binding var points: Int
    let isSimple: Bool
    
    var body: some View {
        StarView(points: $points, isSimple: true)
            .transition(.scale)
            .animation(.linear(duration: 2),
                       value: progress[5])
    }
}

struct StepFiveView_Previews: PreviewProvider {
    static var previews: some View {
        StepFiveView(progress: .constant([0, 0, 0, 0, 0, 1]),
                     points: .constant(5),
                     isSimple: true)
            .frame(width: 300, height: 300)
    }
}
        
