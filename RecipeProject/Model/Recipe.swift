//
//  Recipe.swift
//  RecipeProject
//
//  Created by Kemal Ekren on 17.10.2021.
//

import SwiftUI
import RealmSwift

class Recipe: Object, Identifiable {
    @objc dynamic var id = UUID()
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    @objc dynamic var occupation = ""
    @objc dynamic var detail = ""
}
