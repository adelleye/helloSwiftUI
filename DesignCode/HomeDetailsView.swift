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
    @State var showUpdate = false
    
    var body: some View {
       
        ScrollView {
            VStack {
                          HStack {
                              Text("Watching")
                                //.font(.system(size: 28, weight: .bold, design: .default))
                                .font(.system(size: 28, weight: .bold, design: .default))
                              Spacer()
                              AvatarView(showMenu: $showMenu)
                             
                            Button(action: {self.showUpdate.toggle()}) {
                            
                                Image(systemName: "bell")
                                    .renderingMode(.original)
                                    .font(.system(size: 16, weight: .medium ))
                                .frame(width: 36, height: 36 )
                                    .background(Color.white)
                                .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                            }
                             //Modifier used to present view
                                .sheet(isPresented: $showUpdate, content: {
                                    UpdateList()
                                }
                            )
                          }
                          .padding(.horizontal)
                          .padding(.leading, 14)
                          .padding(.top, 30)
                          
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding( .horizontal, 30)
                        .padding(.bottom, 30)
                }
               
                
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
                    
                    .padding(.horizontal, 30)
                    .padding(.bottom, 60)
                
                }
                
                
                HStack {
                    Text("25 Courses")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                SectionView(section: sectionData[2], width: screen.width-60, height: 275)
                
                Spacer()
                          
                        
            }
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
    var width:CGFloat = 275
    var height:CGFloat = 275
    
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
        .frame(width: width, height: height)
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


struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack (spacing: 12)  {
                RingView(width: 44, height: 44, percentage: 82, color1: #colorLiteral(red: 0, green: 0.3333333333, blue: 1, alpha: 1), color2: #colorLiteral(red: 0.631372549, green: 0.5294117647, blue: 1, alpha: 1), showProgress: .constant(true))
                
                VStack(alignment: . leading, spacing: 4) {
                    Text("6 minutes left")
                        .font(.system(size: 15, weight: .semibold , design: .default))
                    Text("Watched 10 mins today")
                        .font(.system(size: 12, weight: .regular , design: .default))
                        .foregroundColor(Color.black.opacity(0.6))
                    
                }
                
            }
            .padding(.vertical, 8)
            .padding(.leading, 8)
            .padding(.trailing, 20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            
            
            
            
            HStack  {
                RingView(width: 34, height: 34, percentage: 63, color1: #colorLiteral(red: 0.262745098, green: 0.3254901961, blue: 0.9960784314, alpha: 1), color2: #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1), showProgress: .constant(true))
                
            }
            .padding( 8)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            
            
            
            HStack  {
                RingView(width: 34, height: 34, percentage: 70, color1: #colorLiteral(red: 0.9568627451, green: 0.04705882353, blue: 0.2901960784, alpha: 1), color2: #colorLiteral(red: 1, green: 0.7843137255, blue: 0.5607843137, alpha: 1), showProgress: .constant(true))
                
            }
            .padding( 8)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            
            
        }
    }
}
