//
//  RingView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-10.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var width:CGFloat = 100
    var height: CGFloat = 100
    var percentage: CGFloat = 70
    var color1 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var color2 = #colorLiteral(red: 0.631372549, green: 0.5294117647, blue: 1, alpha: 1)
    
    @Binding var showProgress: Bool
    
    var body: some View {
        
        let multiplier = width / 44
        let progress = 1-(percentage/100)

        
       return ZStack {
            Circle()
                .stroke(Color(#colorLiteral(red: 0.2705882353, green: 0.2352941176, blue: 0.7882352941, alpha: 1)).opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                .frame(width: width, height: height)
            
            
            Circle()
                .trim(from: showProgress ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit:.infinity, dash: [20,0], dashPhase: 0)
            )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percentage))%")
                .font(.system(size: 14 * multiplier, weight: .bold, design: .default))
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(showProgress: .constant(true))
    }
}
