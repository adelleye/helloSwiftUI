//
//  RingView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-10.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(#colorLiteral(red: 0.2705882353, green: 0.2352941176, blue: 0.7882352941, alpha: 1)).opacity(0.1), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                .frame(width: 44, height: 44)
            
            
            Circle()
                .trim(from: 0.25, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.3333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.631372549, green: 0.5294117647, blue: 1, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit:.infinity, dash: [20,0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .frame(width: 44, height: 44)
                .shadow(color: Color(#colorLiteral(red: 0.631372549, green: 0.5294117647, blue: 1, alpha: 1)).opacity(0.3), radius: 3, x: 0, y: 3)
            
            Text("75%")
                .font(.system(size: 14, weight: .bold, design: .default))
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
