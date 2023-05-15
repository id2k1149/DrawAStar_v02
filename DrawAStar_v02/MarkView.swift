//
//  MarkView.swift
//  CircleWithMarks
//
//  Created by Max Franz Immelmann on 5/12/23.
//

import SwiftUI

struct MarkView: View {
    
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(width: 2,
                   height: 20)
    }
}

struct MarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
    }
}
