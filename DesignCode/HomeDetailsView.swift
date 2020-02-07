//
//  HomeDetailsView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-07.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct HomeDetailsView: View {
    @Binding var showMenu : Bool
    
    var body: some View {
          VStack {
                      HStack {
                          Text("Watching")
                              .font(.title)
                              .fontWeight(.bold)
                          Spacer()
                          AvatarView(showMenu: $showMenu)
                         
                      }
                      .padding(.horizontal)
                      Spacer()
                      
                    
                  }
    }
}

struct HomeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailsView(showMenu: .constant(false))
    }
}
