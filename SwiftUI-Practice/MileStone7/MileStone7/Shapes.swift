//
//  Shapes.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/23.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Triangle()
//            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
        
//        Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
//            .stroke(Color.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
        
        Arrow()
            .stroke(Color.pink, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.midY - 30))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY - 30))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY + 30))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 30))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 60))
        path.addLine(to: CGPoint(x: rect.midX + rect.midX / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - 60))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - 30))
        
        return path
    }
}

struct Arc: InsettableShape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        
        return arc
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
