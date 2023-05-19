//
//  StartView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/15/23.
//

import SwiftUI

struct StartView: View {

    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        ZStack {
            VStack {
                HStack {
                    VStack {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .padding()
                        Text("Pencil and Paper")
                    }
                    VStack {
                        Image(systemName: "compass.drawing")
                            .resizable()
                        .padding()
                        Text("Compass")
                    }
                }
                .padding()
                HStack {
                    VStack {
                        Image(systemName: "ruler")
                            .resizable()
                        .padding()
                        Text("Ruler")
                    }
                    VStack {
                        Image(systemName: "eraser")
                            .resizable()
                        .padding()
                        Text("Eraser")
                    }
                }
                .padding()
            }
        }
        .frame(width: diameter,
               height: diameter)
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
