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
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8549019608, green: 0.8745098039, blue: 0.9176470588, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                
            
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
                
              
            }
            .padding(.top, 44)
            .background(Color.white)
              
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showMenu ? -500 : 0)
            .rotation3DEffect(Angle(degrees: showMenu ? Double(viewState.height)/15 - 10 : 0), axis: (x: 10.0 , y: 0, z: 0))
            
            .scaleEffect( showMenu ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            
            MenuView()
            
                .background(Color.black.opacity(0.001))
                .offset( y: showMenu ? 0 : 1000)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                     self.showMenu.toggle()
            }
            
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
                
            }
            .onEnded{ value in
                if self.viewState.height > 50 {
                    self.showMenu = false
                }
                
                self.viewState = .zero
            
            }
            
            )
            
           
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
