//
//  QuizCardView2.swift
//  Language_Project
//
//  Created by Jan Grnac on 28/01/2025.
//

import SwiftUI

struct QuizCardView: View {
    
    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
    @State private var flippedStates: [String: Bool] = [:]
    
    var body: some View {
//        NavigationView { // Wrap everything in NavigationView
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            
            VStack {
                if vocabularyViewModel.items.isEmpty {
                    Text("No vocabulary available")
                        .font(.title)
                        .foregroundColor(.gray)
                } else {
                    TabView {
                        ForEach(vocabularyViewModel.items) { vocabulary in
                            ReviewCardView(
                                vocabulary: vocabulary,
                                textC: .black,
                                color: .white,
                                scolor: .white,
                                isFlipped: flippedStates[vocabulary.id] ?? false
                            )
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    flippedStates[vocabulary.id]?.toggle()
                                }
                            }
                            .padding() // Adds space around the cards
                        }
                    }
                    .tabViewStyle(PageTabViewStyle()) // Enables horizontal swiping
                    .indexViewStyle(PageIndexViewStyle()) // Shows page indicator (dots)
                }
            }
            .navigationTitle("Review Cards")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
            .onAppear {
                for vocab in vocabularyViewModel.items {
                    if flippedStates[vocab.id] == nil {
                        flippedStates[vocab.id] = false
                    }
                }
            }
        }
//        }
    }
}

#Preview {
    QuizCardView()
        .environmentObject(VocabularyViewModel())
}

