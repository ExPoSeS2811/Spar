//
//  DottedLineText.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 31.01.2024.
//

import SwiftUI


struct DottedLineText: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .padding(.trailing, Component.halfModule)
            DottedLine()
                .stroke(Color.gray, lineWidth: 1)
                .frame(height: 1)
                .offset(y: 4)
            Text(value)
                .padding(.leading, Component.halfModule)
                .multilineTextAlignment(.trailing)
        }
        .font(.system(size: 12))
    }
}

// We can use a rectangle instead, but this stroke will be slanted
/*
 Rectangle()
 .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
 .foregroundColor(.gray)
 .frame(height: 1)
 .offset(y: 3)
 */

struct DottedLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let circleRadius: CGFloat = 0.4
            let circlesSpacing: CGFloat = 4
            var xPosition: CGFloat = circleRadius
            
            while xPosition < rect.width {
                path.addArc(center: CGPoint(x: xPosition, y: rect.midY),
                            radius: circleRadius,
                            startAngle: .zero,
                            endAngle: .degrees(360),
                            clockwise: true)
                xPosition += circlesSpacing
            }
        }
    }
}
