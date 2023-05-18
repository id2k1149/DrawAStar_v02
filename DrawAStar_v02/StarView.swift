//
//  StarView.swift
//  DrawAStar
//
//  Created by Max Franz Immelmann on 5/10/23.
//

import SwiftUI

struct StarView: View {
    @Binding var points: Int
    let isSimple: Bool
    
    var body: some View {
        let angle = 360 / Double(points)
        ZStack {
            ForEach(0..<points, id: \.self) { iteration in
                DiamondView(
                    points: $points,
                    isSimple: isSimple)
                .rotationEffect(.degrees(Double(iteration) * angle))
            }
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(
            points: .constant(5),
            isSimple: true
        )
        .frame(width: 300, height: 300)
    }
}
