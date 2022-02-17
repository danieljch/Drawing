//
//  ContentView.swift
//  Drawing
//
//  Created by Daniel Jesus Callisaya Hidalgo on 17/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 300)
            Arc(startAngle: .degrees(00), endAngle: .degrees(180), clockwise: false)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
        }
     
    
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

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
