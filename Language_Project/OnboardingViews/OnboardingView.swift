//
//  OnboardingView.swift
//  Language_Project
//
//  Created by Jan Grnac on 01/02/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    //Onboarding states:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    
    // onboarding inputs
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    //for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            //content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            
            //button
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

#Preview {
    OnboardingView()
        .background(Color.purple)
}

//MARK: COMPONENTS

extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP": onboardingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            //.foregroundColor(Color(red: 0, green: 0.328, blue: 0.574))
            .foregroundColor(Color.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "text.book.closed.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .padding()
                .background(Color.purple.opacity(0.1))
                .clipShape(Circle())
                .foregroundColor(Color.primary)
            Text("Practice your vocabulary.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.primary)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(Color.primary)
                    , alignment: .bottom
                )
                Text("This is the a great app for practicing your vocabulary in a fun and simple.")
                    .fontWeight(.medium)
                    .foregroundColor(Color.primary)
                Spacer()
                Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            TextField("Your name here ...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)

            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your age ?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider (
                value: $age,
                in: 18...100,
                step: 1
            )
            .accentColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your gender ?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Menu {
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Nom-Binary").tag("Non-Binary")
                } label: {
                    Text("gender picker")
                    }
                                
            } label: {
                Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            
//            Picker (
//                selection: $gender,
//                label:
//                    Text("Select a gender")
//                    .font(.headline)
//                    .foregroundColor(.purple)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                ,
//                content: {
//                    Text("Male").tag("Male")
//                    Text("Female").tag("Female")
//                    Text("Non-binary").tag("Non-binary")
//
//            })
//            .pickerStyle(MenuPickerStyle())
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}


// MARK: FUNCTIONS

extension OnboardingView {
    
    func handleNextButtonPressed() {
        
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long!😟")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender moving forward! 😩" )
                return
            }
        default:
            break
        }
        
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
                
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
    
