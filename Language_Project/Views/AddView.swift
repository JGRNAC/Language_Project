//
//  AddView.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel
    
    // new code - used to determine if editing an existing vocabulary item
    var editingVocabulary: VocabularyModel? = nil
    // end of new code
    
    @State var textFieldText_1: String = ""
    @State var textFieldText_2: String = ""
    @State var selectedLanguage: String = "🇪🇸"
    
    let languages = ["🇪🇸", "🇩🇪", "🇮🇹", "🇫🇷", "🇷🇺", "🇯🇵"]
        
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""

    var body: some View {
        ZStack {
            RadialGradient(
                            gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                            center: .topLeading,
                            startRadius: 5,
                            endRadius: UIScreen.main.bounds.height
                        )
            .ignoresSafeArea()
            ScrollView {
                VStack (spacing: 20) {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Select Language")
                                .font(.headline)
                            Spacer()
                            Picker("Select Language", selection: $selectedLanguage) {
                                ForEach(languages, id: \.self) { language in
                                    Text(language).tag(language)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                        }
                        
                        TextField("Type original word here...", text: $textFieldText_1)
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                        
                        TextField("Type translation here...", text: $textFieldText_2)
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    }
                    
                    Button(action: saveButtonPressed, label: {
                        //new code - to show the button functionality
                        Text(editingVocabulary == nil ? "Save".uppercased() : "Update".uppercased())
                        //Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                }
                .padding(10)
            }
        }
        //.navigationTitle("Add an Item 🖊️") - new piece of code
        .navigationTitle(editingVocabulary == nil ? "Add an Item 🖊️" : "Edit Word ✏️")
        // end of new piece of code
        //.alert(isPresented: $showAlert, content: getAlert)
        .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle))
        }
        //New Piece of code
        .onAppear {
            if let vocab = editingVocabulary {
                textFieldText_1 = vocab.word
                textFieldText_2 = vocab.translation
                selectedLanguage = vocab.language
            }
        }
        // end of new piece of code
    }
    
//    func saveButtonPressed() {
//        if textIsAppropriate() == true {
//            vocabularyViewModel.addVocabulary(language: selectedLanguage, word: textFieldText_1, translation: textFieldText_2)
//            presentationMode.wrappedValue.dismiss()
//        }
//    }
    
    func saveButtonPressed() {
        let trimmedWord = textFieldText_1.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let isDuplicate = vocabularyViewModel.items.contains {
            $0.language == selectedLanguage &&
            $0.word.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == trimmedWord
        }

        if trimmedWord.count < 2 || textFieldText_2.count < 2 {
            alertTitle = "Word and translation must be at least 2 characters."
            showAlert = true
            return
        }

        if isDuplicate && editingVocabulary == nil {
            alertTitle = "This word already exists in your vocabulary list."
            showAlert = true
            return
        }

        if let existing = editingVocabulary {
            let updated = VocabularyModel(
                id: existing.id,
                language: selectedLanguage,
                word: textFieldText_1,
                translation: textFieldText_2
            )
            vocabularyViewModel.updateVocabulary(vocabulary: updated)
        } else {
            vocabularyViewModel.addVocabulary(
                language: selectedLanguage,
                word: textFieldText_1,
                translation: textFieldText_2
            )
        }

        presentationMode.wrappedValue.dismiss()
    }
        
//        if textIsAppropriate() {
//            if let existing = editingVocabulary {
//                let updated = VocabularyModel(
//                    id: existing.id,
//                    language: selectedLanguage,
//                    word: textFieldText_1,
//                    translation: textFieldText_2
//                )
//                vocabularyViewModel.updateVocabulary(vocabulary: updated)
//            } else {
//                vocabularyViewModel.addVocabulary(
//                    language: selectedLanguage,
//                    word: textFieldText_1,
//                    translation: textFieldText_2
//                )
//            }
//            presentationMode.wrappedValue.dismiss()
//        }
//    }
    
    func textIsAppropriate() -> Bool {
        if (textFieldText_1.count < 2) || (textFieldText_2.count < 2) {
            alertTitle = "Too short!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(VocabularyViewModel())
}
