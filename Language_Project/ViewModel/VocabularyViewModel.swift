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
    
    //let itemsKey: String = "items"
    //the following line 20 replaces the code in line 18 with a consistent storage key and following best practice for maintainability and correctness
    private let itemsKey = "vocabulary"
    
    
    //replacing getItems with loadVocabulary for clarity and completeness
    init() {
//        getItems()
        loadVocabulary()
    }
    
    // replacing getItems with loadVocabulary
//    func getItems() {
    func loadVocabulary() {
        guard
            //let data = UserDefaults.standard.data(forKey: "items"),
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([VocabularyModel].self, from: data)
        else {return }
        
        self.items = savedItems
    }
    
    //updated deleteVocabulary function using offsets
//    func deleteVocabuary(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
    func deleteVocabulary(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
    func moveVocabulary(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    
    //including an updated version of the addVocabulary function that avoids adding words with empty strings
//    func addVocabulary(language: String, word: String, translation: String) {
//        let newVocabulary = VocabularyModel(language: language, word: word, translation: translation)
//        items.append(newVocabulary)
//    }
    
    func addVocabulary(language: String, word: String, translation: String) {
        let trimmedWord = word.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let isDuplicate = items.contains {
            $0.language == language &&
            $0.word.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == trimmedWord
        }
        guard !word.trimmingCharacters(in: .whitespaces).isEmpty,
              !translation.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }

        let newVocabulary = VocabularyModel(language: language, word: word, translation: translation, known: false)
        items.append(newVocabulary)
    }
    

    
//    func updateVocabulary(vocabulary: VocabularyModel) {
//        if let index = items.firstIndex (where: {$0.id == vocabulary.id}) {
//            items[index] = vocabulary.updateCompletion()
//        }
//    }
//    
    
    //the following code, starting from line 57 updates the previous updateVocabulary function from line 49
    
    func updateVocabulary(vocabulary: VocabularyModel) {
        if let index = items.firstIndex(where: { $0.id == vocabulary.id }) {
            items[index] = vocabulary
        }
    }
    
    
//    func saveVocabulary() {
//        if let encodedData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodedData, forKey: "vocabulary")
//        }
//    }
    
    //the following code, starting from line 72 updates the previous saveVocabulary function from line 65 by updating the definition of forKey so as for it to be used consistenly across the code, as currently, the vocabulary is hardcoded as opposed it being dynamic
    
    func saveVocabulary() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
