//
//  ListView.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
    let softPurple = Color(hue: 0.75, saturation: 0.4, brightness: 0.9)
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    RadialGradient(
                        gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                        center: .topLeading,
                        startRadius: 5,
                        endRadius: UIScreen.main.bounds.height
                    )
                    .ignoresSafeArea()
                    
                    if vocabularyViewModel.items.isEmpty {
                        NoVocabularyView()
                            .transition(.opacity)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(Array(vocabularyViewModel.items.enumerated()), id: \.element.id) { index, vocabulary in
                                    HStack(alignment: .center) {
                                        NavigationLink(destination: AddView(editingVocabulary: vocabulary)) {
                                            CardView(vocabulary: vocabulary)
                                                .frame(maxWidth: .infinity)
                                        }

                                        Button(action: {
                                            vocabularyViewModel.deleteVocabulary(at: IndexSet(integer: index))
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .background(Color.red)
                                                .clipShape(Circle())
                                                .shadow(radius: 4)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }
                    }
                }
                .navigationTitle("Language List")
                .navigationBarItems(
                    trailing: NavigationLink("Add", destination: AddView())
                )
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            QuizCardView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Practice")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            QuizGameView()
                .tabItem {
                    Image(systemName: "lightbulb.fill")
                    Text("Quiz")
                }
        }
    }
}

    
    
//    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
//    @State private var showDeleteAlert = false
//    @State private var indexSetToDelete: IndexSet?
//    
//    var body: some View {
//        TabView {
//            ZStack {
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.purple, Color.black]),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: UIScreen.main.bounds.height
//                )
//                .ignoresSafeArea()
//                
//                if vocabularyViewModel.items.isEmpty {
//                    NoVocabularyView()
//                        .transition(AnyTransition.opacity.animation(.easeInOut))
//                } else {
//                    List {
//                        ForEach(vocabularyViewModel.items) {vocabulary in
//                            CardView(vocabulary: vocabulary)
//                                .onTapGesture {
//                                    withAnimation(.linear) {
//                                        vocabularyViewModel.updateVocabulary(vocabulary : vocabulary)
//                                    }
//                                }
//                        }
//                        .onDelete(perform: vocabularyViewModel.deleteVocabulary)
//                        .onMove(perform: vocabularyViewModel.moveVocabulary)
//                    }
////                    .listStyle(PlainListStyle())
//                    .scrollContentBackground(.hidden) // Hide List background
//                    .background(Color.clear) // Ensure full transparency
//                    .onAppear {
//                        UITableView.appearance().backgroundColor = .clear
//                    }
//                }
//            }
//            .navigationTitle("Language List")
//            .navigationBarItems(
//                leading: EditButton(),
//                trailing:
//                    NavigationLink("Add", destination: AddView())
//            )
//            //new code that includes delete alert
//            .alert(isPresented: $showDeleteAlert) {
//                 Alert(
//                     title: Text("Delete Word"),
//                     message: Text("Are you sure you want to delete this word?"),
//                     primaryButton: .destructive(Text("Delete")) {
//                         if let indexSet = indexSetToDelete {
//                             vocabularyViewModel.deleteVocabulary(at: indexSet)
//                         }
//                     },
//                     secondaryButton: .cancel()
//                 )
//             }
//            .tabItem {
//                Image(systemName: "house.fill")
//                Text("Home")
//            }
////            NavigationView {
//            QuizCardView()
////            }
//                .tabItem {
//                    Image(systemName: "brain.head.profile")
//                    Text("Practice")
//            }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//        }
//    }
//}
//
        
#Preview {
//    NavigationView {
        MainTabView()
//    }
    .environmentObject(VocabularyViewModel())
}
