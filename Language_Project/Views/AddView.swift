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
    @State var textFieldText_1: String = ""
    @State var textFieldText_2: String = ""
    @State var selectedLanguage: String = "🇪🇸"
    
    let languages = ["🇪🇸", "🇩🇪", "🇮🇹", "🇫🇷"]
        
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
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
                    Text("Save".uppercased())
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
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            vocabularyViewModel.addVocabulary(language: selectedLanguage, word: textFieldText_1, translation: textFieldText_2)
            presentationMode.wrappedValue.dismiss()
        }
    }
            
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
