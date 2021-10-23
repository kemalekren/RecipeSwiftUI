//
//  Favorites.swift
//  RecipeProject
//
//  Created by Kemal Ekren on 20.10.2021.
//

import SwiftUI

struct Favorites: View {
    @EnvironmentObject var modelData: DBViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Image Name")){
                    TextField("", text: $modelData.imageName)
                }
                Section(header: Text("Title")){
                    TextField("", text: $modelData.title)
                }
                Section(header: Text("Description")){
                    TextField("", text: $modelData.detail)
                }
                Section(header: Text("Occupation")){
                    TextField("", text: $modelData.occupation)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Add Data")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
//                        modelData.addFavorite(presentation: presentation)
                        modelData.createInitialData()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Close") {
                        presentation.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onDisappear(perform: modelData.deInitialData)
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
