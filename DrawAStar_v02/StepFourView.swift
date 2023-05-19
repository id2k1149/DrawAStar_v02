//
//  StepFourView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct StepFourView: View {
    @Binding var progress: [Double]
    @Binding var points: Int
    @State private var currentIndex = 0
    
    var body: some View {
        
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let angle = 360 / points
        let initial = (0..<points).map { iteration in
            let currentAngle = Double(iteration * angle) * Double.pi / 180
            let dotX = radius + radius * CGFloat(sin(currentAngle))
            let dotY = radius - radius * CGFloat(cos(currentAngle))
            return (x: dotX, y: dotY)
        }
        
        let coordinates = getCoordinates(for: points, in: initial)
            
        return ZStack {
            Path { path in
                if coordinates.last?.x == coordinates.first?.x
                    && coordinates.last?.y == coordinates.first?.y {
                    
                    path.addLines(coordinates.map { CGPoint(x: $0.x, y: $0.y) })
                    
                } else {
                    let firstHalf = coordinates.prefix(coordinates.count / 2)
                    path.addLines(firstHalf.map { CGPoint(x: $0.x, y: $0.y) })
                    
                    let secondHalf = coordinates.suffix(coordinates.count / 2)
                    path.addLines(secondHalf.map { CGPoint(x: $0.x, y: $0.y) })
                    
                }
            }
            .trim(from: 0.0, to: CGFloat(min(self.progress[4], 1.0)))
            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            .animation(.linear(duration: 5),
                       value: progress)
        }
        .frame(width: diameter, height: diameter)
    }
    
    private func getCoordinates(for points: Int,
                                in initial: [(x: CGFloat, y: CGFloat)]) ->
    [(x: CGFloat, y: CGFloat)] {
        
        var newArray = [(x: CGFloat, y: CGFloat)]()
        
        if points != 8 {
        
            if initial.count % 2 != 0 {
                
                for (index, element) in initial.enumerated() {
                    if index % 2 == 0 {
                        newArray.append(element)
                    }
                }
                
                for (index, element) in initial.enumerated() {
                    if index % 2 != 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[0])
                
            } else {
                for (index, element) in initial.enumerated() {
                    if index % 2 == 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[0])
                
                for (index, element) in initial.enumerated() {
                    if index % 2 != 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[1])
            }
           
        } else {
            
            for (index, element) in initial.enumerated() {
                if index % 3 == 0 {
                    newArray.append(element)
                }
            }
            
            for (index, element) in initial.enumerated() {
                if index % 3 == 1 {
                    newArray.append(element)
                }
            }
            
            for (index, element) in initial.enumerated() {
                if index % 3 == 2 {
                    newArray.append(element)
                }
            }
            
            newArray.append(initial[0])
        }
        return newArray
    }
}

struct StepFourView_Previews: PreviewProvider {
    static var previews: some View {
        StepFourView(progress: .constant([0, 0, 0, 0, 1, 0]),
                     points: .constant(5))
    }
}
