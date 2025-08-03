//
//  ProfileView.swift
//  Language_Project
//
//  Created by Jan Grnac on 01/02/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                    center: .topLeading,
                    startRadius: 5,
                    endRadius: UIScreen.main.bounds.height
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.purple)

                    Text(currentUserName ?? "Your name here")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("This user is \(currentUserAge ?? 0) years old")
                    Text("Gender: \(currentUserGender ?? "unknown")")

                    NavigationLink(destination: MainTabView()) {
                        Text("Add Vocabulary")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }

                    Button(action: signOut) {
                        Text("SIGN OUT")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                .font(.title3)
                .padding()
                .padding(.vertical, 40)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 10)
                .padding(.horizontal)
            }
            .navigationTitle("Profile")
        }
    }

    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
