//
//  QuizView.swift
//  Language_Project
//
//  Created by Jan Grnac on 25/01/2025.
//

//import SwiftUI
//
//struct QuizView: View {
//    
//    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
//    
//    var body: some View {
//        TabView {
//            ForEach(vocabularyViewModel.items) {vocabulary in
//                QuizCardView(vocabulary: vocabulary)
//                    .background(
//                        RadialGradient(
//                            gradient: Gradient(colors: [Color.blue, Color.red]),
//                            center: .center,
//                            startRadius: 5,
//                            endRadius: 300
//                        )
//                    )
//                    .frame(height:1000)
//            }
//            .tabViewStyle(PageTabViewStyle())
//            
//            .tabItem {
//                Image(systemName: "house.fill")
//                Text("Home")
//            }
//            
//            Text("PLACEHOLDER")
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//            Text("PLACEHOLDER")
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//        }
//        .navigationTitle("Quiz List")
//        .navigationBarItems(
//            leading: EditButton(),
//            trailing:
//                NavigationLink("Add", destination: AddView())
//        )
//    }
//}
//
//
//#Preview {
//    NavigationView {
//        QuizView()
//            .environmentObject(VocabularyViewModel())
//    }
//}
