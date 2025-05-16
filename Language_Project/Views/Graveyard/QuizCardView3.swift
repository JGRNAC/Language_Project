//
//  FlipView.swift
//  Language_Project
//
//  Created by Jan Grnac on 13/01/2025.
//

import SwiftUI

struct QuizCardView3: View {
    
    @State var isFlipped = false
    let vocabulary: VocabularyModel

    var body: some View {
        ZStack {
            myCard(text: vocabulary.word, textC: .white, color: .black, scolor: .white, isTrue: 0, isFalse: -90, isFlipped: isFlipped)
                .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            
            myCard(text: vocabulary.translation, textC: Color(.black), color: .white, scolor: .black, isTrue: 90, isFalse: 0, isFlipped: isFlipped)
                .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
        }
        .onTapGesture {
            withAnimation (.easeIn) {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    QuizCardView3(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
}

struct myCard: View {
    var text: String
    var textC: Color
    var color: Color
    var scolor: Color
    var isTrue: CGFloat
    var isFalse: CGFloat
    var isFlipped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .foregroundColor(color)
                .overlay(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0, to: 0.20)
                        .frame(width: 220, height: 200)
                        .foregroundColor(scolor)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        
                }
            
            
            Text(text).bold().font(.title)
                .foregroundStyle(textC)
        }
        .rotation3DEffect(
            .degrees(isFlipped ? isTrue : isFalse),
                axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
