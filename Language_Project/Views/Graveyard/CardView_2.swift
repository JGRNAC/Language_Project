//
//  CardView.swift
//  Language_Project
//
//  Created by Jan Grnac on 13/01/2025.
//

import SwiftUI

struct CardView_2: View {
    
    @State var isShowingAnswer = false
    
    let vocabulary: VocabularyModel
    
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            VStack {
                Text(vocabulary.word)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding()
                
                if isShowingAnswer {
                    Text(vocabulary.translation)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding()
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    CardView_2(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"))
}
