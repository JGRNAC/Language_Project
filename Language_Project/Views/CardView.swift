//
//  UpdatedCardView.swift
//  Language_Project
//
//  Created by Jan Grnac on 23/01/2025.
//

import SwiftUI

struct CardView: View {

    let vocabulary: VocabularyModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.purple.opacity(0.3), lineWidth: 2) // Subtle border
                )
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            HStack {
                Text(vocabulary.language)
                    .font(.largeTitle)
                    .padding(.leading, 20)
                //                    Divider()
                //                        .frame(height: 100)
                //                        .padding(.horizontal, 50)
                Spacer()
                
                VStack {
                    Text(vocabulary.word)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.bottom, 5)
                    
                    Text(vocabulary.translation)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding()
                }
                Spacer()
                //                    .padding(20)
                //                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .frame(width: 350, height: 150)
        .background(Color.clear)
    }
}

#Preview {
    CardView(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
}
