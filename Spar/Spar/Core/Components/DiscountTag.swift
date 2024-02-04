//
//  DiscountTag.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 01.02.2024.
//

import SwiftUI

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let controlOffset: CGFloat = rect.height * 0.15
            let angleOffset: CGFloat = 10
            
            path.move(to: CGPoint(x: rect.minX, y: rect.minY + angleOffset))
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX - angleOffset, y: rect.minY),
                control: CGPoint(x: rect.midX, y: rect.minY + angleOffset)
            )
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addQuadCurve(
                to: CGPoint(x: rect.minX, y: rect.maxY),
                control: CGPoint(x: rect.midX, y: rect.maxY + controlOffset)
            )
        }
    }
}

struct DiscountTag: View, Buildable {
    private let title: String
    private var size: Size
    
    init(
        title: String,
        size: Size = .m
    ) {
        self.title = title
        self.size = size
    }
    
    var body: some View {
        ZStack {
            WaveShape()
                .fill(Color.red)
                .frame(width: size.width, height: size.height)
            Text(title)
                .padding(.top, 8)
                .foregroundColor(.white)
                .font(.system(size: size.fontSize, weight: .bold))
        }
    }
    
    // For change size in component like modifier.
    func size(_ size: Size) -> Self {
        map { $0.size =  size}
    }
}

extension DiscountTag {
    enum Size {
        case l
        case m
        case s
        
        var height: CGFloat {
            switch self {
            case .m: return 35
            case .l: return 50
            case .s: return 25
            }
        }
        
        var width: CGFloat {
            switch self {
            case .l: return 100
            case .m: return 70
            case .s: return 50
            }
        }
        
        var fontSize: CGFloat {
            switch self {
            case .l: return 24
            case .m: return 18
            case .s: return 14
            }
        }
    }
}
