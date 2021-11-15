//
//  HomeView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentViewState = 0
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 8) {
                    HStack {
                        Picker("Choose State", selection: $currentViewState) {
                            Text("Top Rated").tag(0)
                            Text("Now Playing").tag(1)
                            Text("Upcoming").tag(2)
                            Text("Popular").tag(3)
                        }.pickerStyle(.segmented)
                    }.frame(width: 400).padding(.top, 3)
                    
                    if(currentViewState == 0) {
                       // HomePopularMoviesView()
                        HomeTopRatedMoviesView()
                    } else if currentViewState == 1 {
                        HomeNowPlayingView()
                    } else if currentViewState == 2 {
                        HomeUpcomingMoviesView()
                    } else if currentViewState == 3 {
                        HomePopularMoviesView()
                    }
                    Spacer()
                }.navigationTitle(Text("My Movies App"))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button {
                                print("Tapped")
                            } label : {
                                ZStack {
                                    NavigationLink(destination: SettingsView()) {
                                        Image(systemName: "gear")
                                    }.navigationBarBackButtonHidden(true)
                                }
                            }
                        }
                }
            }
        }
    }
}
    
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
