//
//  Carousel.swift
//  Language_Project
//
//  Created by Jan Grnac on 28/01/2025.
//

import SwiftUI

struct CardCarouselView: View {
    let cards: [CardData] = [
        CardData(title: "Discover the World", subtitle: "Explore new places", imageName: "globe"),
        CardData(title: "Stay Fit", subtitle: "Your fitness journey", imageName: "figure.walk"),
        CardData(title: "Learn Something New", subtitle: "Expand your horizons", imageName: "book.fill"),
        CardData(title: "Enjoy the Moment", subtitle: "Relax and unwind", imageName: "sun.max.fill")
    ]
    
    var body: some View {
        TabView {
            ForEach(cards) { card in
                CardView2(card: card)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 400) // Adjust height to fit your design
        .padding(.vertical, 20)
    }
}

struct CardView2: View {
    let card: CardData
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: card.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .padding(.bottom, 10)
            
            Text(card.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            
            Text(card.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal, 30)
    }
}

struct CardData: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

#Preview {
    CardCarouselView()
}
