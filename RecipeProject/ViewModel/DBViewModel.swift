//
//  DBViewModel.swift
//  RecipeProject
//
//  Created by Kemal Ekren on 17.10.2021.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
    @Published var title = ""
    @Published var imageName = ""
    @Published var occupation = ""
    @Published var detail = ""
    
    @Published var openNewPage = false
    
    init() {
        fetchRecipe()
    }
    
// Fetch Data
    
    @Published var recipes: [Recipe] = []
    
    func fetchRecipe() {
        guard let ref = try? Realm() else { return }
        
        let results = ref.objects(Recipe.self)
        self.recipes = results.compactMap({ (recipe) -> Recipe? in
            return recipe
        })
        
    }
    
 // Add New Data
    
    func addFavorite(presentation: Binding<PresentationMode>) {
        let recipe = Recipe()
        recipe.title = title
        recipe.imageName = imageName
        recipe.occupation = occupation
        recipe.detail = detail
        
        guard let ref = try? Realm() else { return }
        
        do {
            try ref.write {
                ref.add(recipe)
                fetchRecipe()
            }
        }
        catch {
            print("There is an error while adding object")
        }
        
        presentation.wrappedValue.dismiss()
        
    }
    
    func deleteItem(object: Recipe) {
        guard let ref = try? Realm() else { return }
        
        do {
            try ref.write {
                ref.delete(object)
                fetchRecipe()
            }
        }
        catch {
            print("There is an error while adding object")
        }
    }
    
    func deInitialData() {
        imageName = ""
        title = ""
        detail = ""
        occupation = ""
    }
}
