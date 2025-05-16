//
//  Language_ProjectApp.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

@main
struct Vocabzilla: App {
    
    @StateObject var vocabularyViewModel: VocabularyViewModel = VocabularyViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
            }
            .environmentObject(vocabularyViewModel)
        }
    }
}
