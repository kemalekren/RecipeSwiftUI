//
//  HomeView.swift
//  RecipeProject
//
//  Created by Kemal Ekren on 17.10.2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var modelData = DBViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 15) {
                    ForEach(modelData.recipes) { recipe in
                        HStack(spacing: 10){
                            Image(recipe.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(recipe.title)
                                    .font(.caption)
                                Text(recipe.detail)
                                Text(recipe.occupation)
                            }
                            Spacer()
                        }
                        .contextMenu(menuItems: {
                            Button("Delete Item") {
                                modelData.deleteItem(object: recipe)
                            }
                        })
                    }
                }
            }
            .navigationTitle("Recipe App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {modelData.openNewPage.toggle()}) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $modelData.openNewPage) {
                Favorites()
                    .environmentObject(modelData)
            }
        }
    }
}

