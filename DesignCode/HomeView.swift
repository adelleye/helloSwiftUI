//
//  HomeView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-07.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var showMenu = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {self.showMenu.toggle()} ) {
                       Image("Avatar")
                        .renderingMode(.original) // removes blend
                        .resizable()
                        .frame(width: 36, height: 36)
                    .clipShape(Circle())
                       }
               
            }
            .padding(.horizontal)
            Spacer()
            
            MenuView()
                .offset( y: showMenu ? 0 : 1000)
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
