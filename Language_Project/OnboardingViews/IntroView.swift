//
//  IntroView.swift
//  Language_Project
//
//  Created by Jan Grnac on 01/02/2025.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.black]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move (edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move (edge: .top)))
            }
        //if user is signed in/
        //profile view
        //else
        //onboarding view
        }
        .animation(.spring(), value: currentUserSignedIn)
    }
}

#Preview {
    IntroView()
}
