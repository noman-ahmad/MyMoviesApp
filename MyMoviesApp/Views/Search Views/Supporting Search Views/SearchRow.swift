//
//  SearchRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI
import Kingfisher

struct SearchRow: View {
    
    var movieTitle = ""
    var movieYear = ""
    var image_url = ""
    
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                if image_url != "" {
                    KFImage(URL(string: image_url)).resizable().frame(width: 75, height: 125).background(Color.gray).border(Color.gray)
                } else {
                    Image("placeholder-poster").resizable().frame(width: 75, height: 125).background(Color.gray).border(Color.gray)
                }
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(movieTitle).fontWeight(.bold).font(.subheadline)
                
                HStack {
                    Text("\(movieYear)").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
            }.frame(height: 125)
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(movieTitle: "", movieYear: "", image_url: "")
    }
}
