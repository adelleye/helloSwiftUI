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
                            //.font(.system(size: 28, weight: .bold, design: .default))
                            .font(.system(size: 28, weight: .bold, design: .default))
                          Spacer()
                          AvatarView(showMenu: $showMenu)
                         
                      }
                      .padding(.horizontal)
                      .padding(.leading, 14)
                      .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                //3d Scroll Animation using Geometry Reader
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -25
                                ), axis: (x: 0, y: 10, z: 0))
                        }
                    .frame(width: 275, height: 275)
                    }
               
                }
                .padding(.top , 30)
                .padding(.horizontal, 30)
                .padding(.bottom, 60)
            
            }
            Spacer()
                      
                    
                  }
    }
}

struct HomeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailsView(showMenu: .constant(false))
    }
}

struct SectionView: View {
    var section : Section
     
    
    var body: some View {
        VStack  {
            HStack (alignment : .top){
                Text(section.title)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
                
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text)
                .font(.system(size: 15, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
            //.background(Color(#colorLiteral(red: 0.4156862745, green: 0.3333333333, blue: 0.9882352941, alpha: 1)))
            .background(section.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [ Section(title: "Prototype designs in SwiftUI", text: "18 SECTIONS", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    
    Section(title: "Build a SwiftUI app", text: "20 SECTIONS", logo: "Logo1", image: Image("Card2"), color: Color(#colorLiteral(red: 0.968627451, green: 0.2156862745, blue: 0.3411764706, alpha: 1))),
    
    Section(title: "SwiftUI advanced", text: "25 SECTIONS", logo: "Logo1", image: Image("Card3"), color: Color(#colorLiteral(red: 0.3843137255, green: 0.2117647059, blue: 1, alpha: 1))),
    

]

