//
//  SearchRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI
import CachedAsyncImage
import Kingfisher

struct SearchRow: View {
    
   var image_url = ""
   var movie_name = ""
   var movie_year = ""
    
    func formatYear(year: String) -> String {
        let new_year = year.replacingOccurrences(of: "(", with: "")
        let newest_year = new_year.replacingOccurrences(of: ")", with: "")
        return newest_year
    }
    
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                KFImage(URL(string: image_url)).resizable().frame(width: 75, height: 100).background(Color.gray)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(movie_name).font(.caption)
                Text(formatYear(year:movie_year)).font(.caption2).foregroundColor(.gray)
                Spacer()
            }.frame(height: 100)
            
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(image_url: "", movie_name: "", movie_year: "")
    }
}
