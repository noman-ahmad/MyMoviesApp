//
//  SettingsUsageView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/3/21.
//

import SwiftUI

struct SettingsUsageView: View {
    var body: some View {
        Form {
            Section(header: Text("Disovering Movies")) {
                VStack {
                    Text("The Home Page allows you to discover trending and popular movies. The top rated movies section allows you to see the top rated movies on TMDB of all time. The Now Playing section allows you to see the movies that are in theatres now around the world. The Popular movies section shows the current popular movies. The Upcoming movies section shows the movies that are yet to be released in theatres around the world.")
                }
            }
            
            Section(header: Text("Searching For Movies")) {
                VStack {
                    Text("In order to search for a movie, click the search tab and type the name of the movie you want to find. Example : 'Inception' ")
                }
            }
            
            Section(header: Text("Adding Movies to Collection")) {
                VStack {
                    Text("In order to add a movie to your collection, click on it after searching or finding it on the home page, and click the add icon on the top left. This movie will now be added to your collection, all movies automatically get pushed to unwatched. In order to mark as watched, go to the unwatched section in the Collection tab and click the edit icon nect to the movie.")
                }
            }
            
            Section(header: Text("Reviews")) {
                VStack {
                    Text("You can leave a review for a movie to be shown on your watched list. Keep this review concise as some of it might get cut off in the list")
                }
            }
            
            Section(header: Text("Ratings")) {
                VStack {
                    Text("Ratings can be assigned from 0 to 10 in increments of .5. Ratings get colors associated with them. Blue Diamond for 10, Ruby for 9.0-9.5, Gold for 8.0-8.5, Silver for 6.0 to 7.5, Bronze for 4.0 to 5.0, and Green-Yellow for 0 to 4.0")
                }
            }
        }
    }
}

struct SettingsUsageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUsageView()
    }
}
