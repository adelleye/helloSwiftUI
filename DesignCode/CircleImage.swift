//
//  CircleImage.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-03.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
