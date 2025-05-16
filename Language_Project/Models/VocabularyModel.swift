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
    
    init(id: String=UUID().uuidString, language: String, word: String, translation: String) {
        self.id = id
        self.language = language
        self.word = word
        self.translation = translation
    }
    
    func updateCompletion() -> VocabularyModel {
        return VocabularyModel(id: id, language: language, word: word, translation: translation)
    }
    
}

