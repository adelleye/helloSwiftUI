//
//  ContentView.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-03.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    
    var body: some View {
            
      
            ZStack {
                TitleView()
                    .opacity(showCard ? 0.4 :1)
                    .offset(x: 0, y: showCard ? -200 : 0)
                    .blur(radius: showCard ? 10: 0)
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                )
             
                
                BackCardView()
                    .frame(width: showCard ? 300 : 340, height: 220)
                    .background(Color("card4"))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -400: -40)
                    .offset(x: viewState.width, y: viewState.height)
                    .offset( y: showCard ? -180 : 0)
                    .scaleEffect(showCard ? 1.0 :0.9)
                    .rotationEffect(.degrees(show ? 0: 10))
                    
                    .rotationEffect(.degrees(showCard ? -10 : 0))
                    .rotation3DEffect(.degrees( showCard ? 0 :10), axis: (x: 10.0, y: 0.0, z: 0.0))
                    .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
                
                BackCardView()
                    .frame(width:  340, height: 220)
                    .background(Color("card3"))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -200: -20)
                    .offset(x: viewState.width, y: viewState.height)
                    .offset( y: showCard ? -140 : 0)
                    .scaleEffect(showCard ? 1.0 :0.95)
                    .rotationEffect(.degrees(show ? 0: 5))
                    //IF SHOW CARD IS TRUE SET ROTATION EFFECT TO -5 ELSE SET TO 0
                    .rotationEffect(.degrees(showCard ? -5 : 0))
                    .rotation3DEffect(.degrees( showCard ? 0: 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.3))
                
                CardView()
                    .frame(width: showCard ? 375 : 340, height: 220)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                    .shadow(radius: 20)
                    .offset(x: viewState.width, y: viewState.height)
                    //moving card up
                    .offset(y: showCard ? -100 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .blendMode(.hardLight)
                    .onTapGesture {
                        self.showCard.toggle()
                }
                .gesture(
                    DragGesture().onChanged {
                        value in self.viewState = value.translation
                        self.show = true
                        
                    }
                    .onEnded {
                        value in self.viewState = CGSize.zero
                        self.show = false
                    }
                )
                
                
                BottomCardView(showProgress: $showCard)
                    .offset(x: 0, y: showCard ? 350: 1550)
                    .blur(radius: show ? 10: 0)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1.0, duration: 0.9))
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
                
           
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
            
        
        
       
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

struct BottomCardView: View {
    @Binding var showProgress: Bool
    
    var body: some View {
        VStack (spacing: 20) {
            
            Rectangle()
                .frame(width: 40, height: 5, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Tobi Adeleye has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
             
            HStack (spacing: 20) {
                RingView(width: 88, height: 88, percentage: 78, color1: #colorLiteral(red: 1, green: 0.4980392157, blue: 0.3098039216, alpha: 1), color2: #colorLiteral(red: 0.6862745098, green: 0.4784313725, blue: 1, alpha: 1) , showProgress: $showProgress)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack (alignment: .leading, spacing: 8){
                    Text("Swift UI Prototype")
                        .font(.system(size: 16, weight: .bold, design: .default))
                    
                    Text("""
12 of 12 sections completed
10 hours spent so far
""")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color.black.opacity(0.6))
                    .lineSpacing(4)
                  
                }
            //.frame(width: 235, height: 100)
                .padding(20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20 , style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color(#colorLiteral(red: 0.6117647059, green: 0.6470588235, blue: 0.7254901961, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
           
            
            }
            
            
            
            Spacer()
            
            
            
            
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 30)
        
    }
}
