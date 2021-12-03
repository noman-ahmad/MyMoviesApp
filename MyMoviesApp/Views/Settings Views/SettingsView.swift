//
//  SettingsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct SettingsView: View {
    
    //@StateObject private var coreDataViewModel = CoreDataViewModel()
    var body: some View {
        NavigationView {
            Form {
                
                Section("Usage") {
                    NavigationLink(destination: SettingsUsageView()) {
                        HStack {
                            Text("How-To")
                            Spacer() 
                        }
                    }
                }
                
                
                Section("About") {
                    NavigationLink(destination: AcknowledgementView()) {
                        HStack {
                            Text("Acknowledgements")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: AboutDeveloperView()) {
                        HStack {
                            Text("Developer")
                            Spacer()
                        }
                    }
                }
            }.navigationTitle("My Movies App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
