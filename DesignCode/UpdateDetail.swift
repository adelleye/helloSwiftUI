//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Tobi Adeleye on 2020-02-09.
//  Copyright © 2020 Tobi Adeleye. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update:updates = updatesData[0]
    
    var body: some View {
        
        List {
            VStack {
                update.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    
                    
                Text(update.description)
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
    .listStyle(PlainListStyle())
    }

}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
