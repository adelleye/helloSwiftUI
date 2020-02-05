//
//  ContentView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-03.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
      
            ZStack {
                TitleView()
                
             
                
                BackCardView()
                    .background(Color("card4"))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(x: 0, y: -40)
                    .scaleEffect(0.9)
                    .rotationEffect(.degrees(10))
                    .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0.0, z: 0.0))
                    .blendMode(.hardLight)
                
                BackCardView()
                    .background(Color("card3"))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(x: 0, y: -20)
                    .scaleEffect(0.95)
                    .rotationEffect(.degrees(5))
                    .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0.0, z: 0.0))
                    .blendMode(.hardLight)
                
                CardView()
                    .blendMode(.hardLight)
                
                VStack (spacing: 20) {
                    
                    Rectangle()
                        .frame(width: 40, height: 5, alignment: .center)
                        .cornerRadius(3)
                        .opacity(0.1)
                    
                    Text("This certificate is proof that Tobi Adeleye has achieved the UI Design course with approval from a Design+Code instructor.")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .lineSpacing(4)
                        Spacer()

                        
                   
                    
                }
                .padding(.top, 10)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 30)
                .offset(x: 0, y: 500)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//card view component
struct CardView: View {
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    
                    VStack (alignment: .leading) {
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text ("Certificate")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image("Logo1")
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                Spacer()
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 110, alignment: .top)
                
            }
                
            .frame(width: 340, height: 220)
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
            
        .frame(width: 340, height: 220)
        
       
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}
