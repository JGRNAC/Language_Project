//
//  NoVocabularyView.swift
//  Language_Project
//
//  Created by Jan Grnac on 10/01/2025.
//

import SwiftUI

struct NoVocabularyView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There is no vocabulary yet")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Don't you want to practice your vocabulary? I think you should click the add button and add a bunch of words to your list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Vocabulary")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor: Color.accentColor)
                            .cornerRadius(10)
                    })
                
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: 10,
                    x: 0.0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding()
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoVocabularyView()
            .navigationTitle("Title")
    }
}
