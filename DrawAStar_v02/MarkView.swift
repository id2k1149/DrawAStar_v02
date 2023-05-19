//
//  MarkView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/12/23.
//

import SwiftUI

struct MarkView: View {
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 2,
                   height: 20)
            Rectangle()
                .fill(Color.black)
                .frame(width: 2,
                   height: 20)
                .rotationEffect(.degrees(90))
        }
        .scaleEffect(isAnimated ? 1.2 : 1.0)
        .opacity(isAnimated ? 1.0 : 0.0)
        .onAppear {
            self.isAnimated = true
        }
    }
}

struct MarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
    }
}
