//
//  VocabularyViewModel.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import Foundation

class VocabularyViewModel: ObservableObject {
    
    @Published var items: [VocabularyModel] = [] {
        didSet {
            saveVocabulary()
        }
    }
    
    let itemsKey: String = "items"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "items"),
            let savedItems = try? JSONDecoder().decode([VocabularyModel].self, from: data)
        else {return }
        
        self.items = savedItems
    }
    
    func deleteVocabuary(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveVocabulary(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addVocabulary(language: String, word: String, translation: String) {
        let newVocabulary = VocabularyModel(language: language, word: word, translation: translation)
        items.append(newVocabulary)
    }

    func updateVocabulary(vocabulary: VocabularyModel) {
        if let index = items.firstIndex (where: {$0.id == vocabulary.id}) {
            items[index] = vocabulary.updateCompletion()
        }
    }
    
    func saveVocabulary() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "vocabulary")
        }
    }
    
}
