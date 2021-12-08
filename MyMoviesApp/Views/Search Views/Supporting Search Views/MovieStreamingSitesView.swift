//
//  MovieStreamingSitesView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/5/21.
//

import SwiftUI
import Kingfisher

struct MovieStreamingSitesView: View {
    
    var streamingSites : [WatchProviderTypeResponse]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Where to Watch").font(.headline).fontWeight(.bold)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(streamingSites, id:\.provider_id){
                        provider in
                        if provider.logo_path != "" {
                            KFImage(URL(string: "https://image.tmdb.org/t/p/original/\(provider.logo_path)")).resizable().frame(width: 90, height: 125).border(Color.gray)
                        }
                    }

                }
            }
        }.padding(.leading).padding(.trailing)
    }
}

struct MovieStreamingSitesView_Previews: PreviewProvider {
    static var previews: some View {
        MovieStreamingSitesView(streamingSites: [])
    }
}
