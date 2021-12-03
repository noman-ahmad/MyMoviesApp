//
//  HomeEmptyRowView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/3/21.
//

import SwiftUI

struct HomeEmptyRowView: View {
    
    var movieTitle : String
    
    let rowHeight : CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(movieTitle).fontWeight(.bold).font(.subheadline).foregroundColor(.primary)
                Spacer() 
            }
        } .frame(height: rowHeight).background(Color(red: 0.6, green: 0.83, blue: 1)).border(Color.gray)
    }
}

struct HomeEmptyRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEmptyRowView(movieTitle: "", rowHeight: 0)
    }
}
