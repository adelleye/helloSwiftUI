//
//  UpdateList.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-09.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
  @ObservedObject var store = UpdateStore()
    
    //Function to add to updatesData - need to create a store (UpdateStore.swift) for this to work.
    
    func addUpdate() {
        
        store.updates.append(updates(title: "React Native for Designers", description: "Build an iOS and Android app from scratch", date:"FEB 10" , image: Image("Card2")))
    }
    
    
    var body: some View {
        NavigationView  {
            List{
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)){
                        
                        HStack (alignment:.top) {
                            update.image
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color(#colorLiteral(red: 0.09411764706, green: 0.1254901961, blue: 0.3137254902, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                                .padding(.trailing, 4)
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                
                                Text(update.description)
                                    .lineLimit(3)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .foregroundColor(Color(#colorLiteral(red: 0.2980392157, green: 0.2980392157, blue: 0.2980392157, alpha: 1)))
                                    .lineSpacing(3)
                                
                                Text(update.date)
                                    .frame(width: 70, height: 24)
                                    .padding(.horizontal , 4)
                                    .padding(.top, 2)
                                    .padding(.bottom, 2)
                                    .background(Color(#colorLiteral(red: 0.09411764706, green: 0.1254901961, blue: 0.3137254902, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                
                            }
                        }
                    
                    }
                    .padding(.vertical, 8)
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                //Drag and update order function
                .onMove { (source: IndexSet, destination: Int) in
                    
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                
                }
                
            }
        .navigationBarTitle("Updates")
            
        .navigationBarItems(leading: Button(action: addUpdate) {
        Text("Add Update")
        },
                            trailing: EditButton()
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct updates : Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var date: String
    var image: Image
    
}

let updatesData = [
   updates( title: "SwiftUI Advanced",
            description: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.",
            date: "DEC 14",
            image: Image("Card1")
    ),
   
   updates( title: "Webflow",
           description: "Design and animate a high converting landing page with advanced interactions, payments and CMS",
           date: "OCT 14",
           image: Image("Card2")
   ),
   
   updates( title: "Advanced Prototyping with ProtoPie",
           description: "Create high-fidelity prototypes with variables, formula, conditions and sensors",
           date: "AUG 27",
           image: Image("Card3")
   ),
   
   updates( title: "Build a SwiftUI app for iOS 13",
             description: "Learn SwiftUI from scratch with layout techniques, advanced interactions, API data, packages and CMS.",
             date: "JUN 25",
             image: Image("Card4")
     ),
   
   updates( title: "UI Interactions in Framer Playground",
             description: "Framer makes it incredibly easy to add complex user interactions inside your prototype, taking your design and code components to the next level",
             date: "APR 01",
             image: Image("Card5")
     )
]



