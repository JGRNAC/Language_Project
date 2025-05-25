//
//  VocabularyModel.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import Foundation

struct VocabularyModel: Identifiable, Codable {
    let id: String
    let language: String
    let word: String
    let translation: String
    //new line for a variable
    var known: Bool
    
    init(id: String=UUID().uuidString, language: String, word: String, translation: String, known: Bool = false) {
        self.id = id
        self.language = language
        self.word = word
        self.translation = translation
        self.known = known
    }
    
    func updateCompletion() -> VocabularyModel {
        return VocabularyModel(id: id, language: language, word: word, translation: translation)
    }
    
}

