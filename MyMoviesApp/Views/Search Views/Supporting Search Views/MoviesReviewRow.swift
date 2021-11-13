//
//  MoviesReviewRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct MoviesReviewRow: View {
    
    var movieReviews : [ReviewResults]
    
    
    var body: some View {
        if movieReviews.count > 0 {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Synopsis").font(.headline).fontWeight(.bold)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    ForEach(movieReviews, id: \.id) {
                        review in
                        VStack {
                            Text(review.content).scaledToFit().minimumScaleFactor(0.5)
                        }.frame(width: 200, height: 200)
                    }
                }
            }
        }
    }
}

struct MoviesReviewRow_Previews: PreviewProvider {
    static var previews: some View {
        MoviesReviewRow(movieReviews: [])
    }
}
