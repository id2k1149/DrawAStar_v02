//
//  DiamondView.swift
//  DrawAStar
//
//  Created by Max Franz Immelmann on 5/10/23.
//

import SwiftUI

struct DiamondView: View {
    @Binding var points: Int
    let isSimple: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let coordinates = isSimple
            ? getSimpleCoordinates(width: width, height: height)
            : getComplexCoordinates(width: width, height: height)
            
            ZStack {
                
                Path { path in
                    path.move(to: coordinates[0])
                    path.addLine(to: coordinates[1])
                    path.addLine(to: coordinates[2])
                }
//                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(Color.red, lineWidth: 2)
//                .animation(.linear(duration: 2), value: progress)
            }
        }
    }
    
    private func getRadius(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let pointX = point1.x
        let pointY = point1.y
        let centerX = point2.x
        let centerY = point2.y
        
        let deltaX = pointX - centerX
        let deltaY = pointY - centerY
        let radius = sqrt(deltaX * deltaX + deltaY * deltaY)
        return radius
    }
    
    private func getComplexCoordinates(width: CGFloat, height: CGFloat) -> [CGPoint] {
        
        let size = min(width, height)
        let middle = size / 2
        
        let angle = 180 / points
        let radius = size * 0.2
        
        let hOffset = radius * sin(Double(angle) * Double.pi / 180)
        let vOffset = radius * cos(Double(angle) * Double.pi / 180)
        
        let leftPointX = middle - hOffset
        let centerY = middle - vOffset
        let rightPointX = middle + hOffset
        
        return [
            CGPoint(x: leftPointX, y: centerY),
            CGPoint(x: middle, y: 0),
            CGPoint(x: rightPointX, y: centerY),
            CGPoint(x: middle, y: middle)
        ]
    }
    
    private func getSimpleCoordinates(width: CGFloat, height: CGFloat) -> [CGPoint] {
        
        let size = min(width, height)
        let middle = size / 2
        
        let angleOne = 360 / points
        let tgOne = tan(Double(angleOne) * Double.pi / 180)
        
        let angleTwo = (180 - angleOne) / 2
        let tgTwo = tan(Double(angleTwo) * Double.pi / 180)
        
        let hOffset = middle / (tgOne + tgTwo)

        let leftPointX = middle - hOffset
        let centerY = hOffset * tgOne
        let rightPointX = middle + hOffset
        
        return [
            CGPoint(x: leftPointX, y: centerY),
            CGPoint(x: middle, y: 0),
            CGPoint(x: rightPointX, y: centerY),
            CGPoint(x: middle, y: middle)
        ]
    }
}


struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondView(
            points: .constant(5),
            isSimple: false
        )
            .frame(width: 300, height: 300)
    }
}
