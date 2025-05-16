//
//  ReviewCardView3.swift
//  Language_Project
//
//  Created by Jan Grnac on 01/02/2025.
//

import SwiftUI

struct ReviewCardView: View {
    
    let vocabulary: VocabularyModel
    
    var textC: Color
    var color: Color
    var scolor: Color
    var isFlipped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .foregroundColor(color)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                }
                .overlay {
                    Text(vocabulary.word)
                        .bold()
                        .font(.title)
                        .foregroundStyle(textC)
                        .frame(width: 180, height: 50, alignment: .center)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .truncationMode(.tail)
                         // Hide text when flipped
                }
                .opacity(isFlipped ? 0 : 1)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .foregroundColor(scolor)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                }
                .overlay {
                    Text(vocabulary.translation)
                        .bold()
                        .font(.title)
                        .foregroundStyle(textC)
                        .frame(width: 180, height: 50, alignment: .center)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .scaleEffect(x: -1)
                        
                }
                .opacity(isFlipped ? 1 : 0) // Show text when flipped

        }
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0), // Flip back card
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        
        .animation(.easeInOut(duration: 0.5), value: isFlipped) // Smooth flipping animation
    }
}

#Preview {
    ReviewCardView(vocabulary: VocabularyModel(language: "🇪🇸", word: "Hola", translation: "Hello"),
                   textC: Color.black,
                   color: Color.blue,
                   scolor: Color.red,
                   isFlipped: false)
}
