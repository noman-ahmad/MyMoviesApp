//
//  AboutDeveloperView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/3/21.
//

import SwiftUI

struct AboutDeveloperView: View {
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Motivation")) {
                    VStack {
                        Text("The main purpose behind this app is to create a centralized platform for movie enthusiasts. This app allows you to discover movies and add them to your watch list. One of the main motivations behind this app was to create a single platform to discover movies as well as keep track of the ones you watch.")
                    }
                }
            }
        }
    }
}

struct AboutDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDeveloperView()
    }
}
