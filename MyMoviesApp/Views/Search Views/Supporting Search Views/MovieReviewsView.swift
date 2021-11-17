//
//  MovieReviewsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/16/21.
//

import SwiftUI

struct MovieReviewsView: View {
    
    @StateObject private var movieReviewsViewModel = MovieReviewViewModel()
    var movieId : Int
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(movieReviewsViewModel.getReviews(), id: \.id) {
                    review in
                    Text(review.content).frame(width: 400, height: 100)
                }
            }
        }.onAppear() {
            movieReviewsViewModel.update(movieId: self.movieId)
        }
    }
}

struct MovieReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReviewsView(movieId: -1)
    }
}
