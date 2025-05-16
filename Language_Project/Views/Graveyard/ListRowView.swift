//
//  ListRowView.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

struct ListRowView: View {
    
    let vocabulary: VocabularyModel
    
    
    var body: some View {
        HStack {
            Text(vocabulary.language)
                .font(.system(size: 20))
                .padding(.trailing, 10)
            
            Text(vocabulary.word)
                .padding(.horizontal, 20)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .truncationMode(.tail)
            
            Rectangle()
                .frame(width: 1, height: 30)
                .foregroundStyle(Color.gray)
                .padding(.horizontal, 40)
            
            Text(vocabulary.translation)
                .padding(.horizontal, 20)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .truncationMode(.tail)
        }
        .font(.title2)
        .padding()
        
    }
}

#Preview {
    ListRowView(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
}
