//
//  ListView.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
    
    var body: some View {
        TabView {
            ZStack {
                RadialGradient(
                    gradient: Gradient(colors: [Color.purple, Color.black]),
                    center: .topLeading,
                    startRadius: 5,
                    endRadius: UIScreen.main.bounds.height
                )
                .ignoresSafeArea()
                
                if vocabularyViewModel.items.isEmpty {
                    NoVocabularyView()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                } else {
                    List {
                        ForEach(vocabularyViewModel.items) {vocabulary in
                            CardView(vocabulary: vocabulary)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        vocabularyViewModel.updateVocabulary(vocabulary : vocabulary)
                                    }
                                }
                        }
                        .onDelete(perform: vocabularyViewModel.deleteVocabuary)
                        .onMove(perform: vocabularyViewModel.moveVocabulary)
                    }
//                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden) // Hide List background
                    .background(Color.clear) // Ensure full transparency
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                    }
                }
            }
            .navigationTitle("Language List")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
//            NavigationView {
            QuizCardView()
//            }
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Practice")
            }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

        
#Preview {
    NavigationView {
        MainTabView()
    }
    .environmentObject(VocabularyViewModel())
}
