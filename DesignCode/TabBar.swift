//
//  TabBar.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-08.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                 Image(systemName: "house")
                 Text("Home")
            }
            
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text ("Certificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
