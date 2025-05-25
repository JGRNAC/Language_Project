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
            HStack(spacing: 0) {
                // Accent color bar on the left
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 6)
                    .cornerRadius(3)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(vocabulary.language)
                            .font(.largeTitle)
                        Spacer()
                        Text(vocabulary.known ? "✅ Known" : "🕑 Learning")
                            .font(.caption)
                            .foregroundColor(.purple.opacity(0.8))
                    }
                    
                    Text(vocabulary.word)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(vocabulary.translation)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(UIColor.secondarySystemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.purple, lineWidth: 1.5)
                        )
                )
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CardView(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
}




//struct CardView: View {
//
//    let vocabulary: VocabularyModel
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
////                .fill(Color.white.opacity(0.9))
//                .fill(Color(UIColor.secondarySystemBackground))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color.purple.opacity(0.3), lineWidth: 2) // Subtle border
//                )
////                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
//                .strokeBorder(Color.purple, lineWidth: 1.5)
//
//            
//            HStack {
//                Text(vocabulary.language)
//                    .font(.largeTitle)
//                    .padding(.leading, 20)
//                //                    Divider()
//                //                        .frame(height: 100)
//                //                        .padding(.horizontal, 50)
//                Spacer()
//                
//                VStack {
//                    Text(vocabulary.word)
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.black)
//                        .padding(.bottom, 5)
//                    
//                    Text(vocabulary.translation)
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.gray)
//                        .padding()
//                    
//                    HStack {
//                           Text(vocabulary.known ? "✅ Known" : "🕑 Learning")
//                               .font(.caption)
//                               .foregroundColor(.purple.opacity(0.8))
//                       }
//    
//                }
//                Spacer()
//                //                    .padding(20)
//                //                    .multilineTextAlignment(.center)
//            }
//            .padding()
//        }
//        .padding()
//        .frame(width: .infinity, height: 160)
//        .background(Color.clear)
//    }
//}
//
//#Preview {
//    CardView(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
//}
