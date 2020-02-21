//
//  Modifiers.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-20.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

// file for Reusable Modifiers

struct  FontModifier : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
    }
}
