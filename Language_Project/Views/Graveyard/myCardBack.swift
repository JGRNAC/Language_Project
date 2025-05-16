//
//  myCardBack.swift
//  Language_Project
//
//  Created by Jan Grnac on 28/01/2025.
//

import SwiftUI

struct myCardBack: View {
    
    let vocabulary: VocabularyModel
    
//    var text: String
//    var textC: Color
//    var color: Color
//    var scolor: Color
//    var isTrue: CGFloat
//    var isFalse: CGFloat
//    var isFlipped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .foregroundColor(Color.blue)
                .overlay(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0, to: 0.20)
                        .frame(width: 220, height: 200)
                        .foregroundColor(Color.black)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        
                }
            
            
            Text(vocabulary.translation).bold().font(.title)
                .foregroundStyle(Color.black)
        }
//        .rotation3DEffect(
//            .degrees(isFlipped ? isTrue : isFalse),
//                axis: (x: 0.0, y: 1.0, z: 0.0)
//        )
    }
}

#Preview {
    myCardBack(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello")/*, textC: .white, color: .black, scolor: .white, isTrue: 0, isFalse: 180, isFlipped: false*/)
}


