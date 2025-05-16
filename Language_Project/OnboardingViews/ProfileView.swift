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
        ZStack {
            
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.black]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text(currentUserName ?? "Your name here")
                Text("This user is \(currentUserAge ?? 0) years old")
                Text("This gender is \(currentUserGender ?? "unknown")")
                
                Text("SIGN OUT")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        signOut()
                    }
                
            }
            .font(.title)
            .padding()
            .padding(.vertical,40)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
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
