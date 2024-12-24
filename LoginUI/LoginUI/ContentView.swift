//
//  ContentView.swift
//  LoginUI
//
//  Created by Aarush Kamat on 12/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isSecured = true
    @State private var showSignUp = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.2)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Fitness Logo
                    Image(systemName: "figure.run.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .foregroundColor(.green)
                    
                    Text("FitTrack")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.green)
                    
                    Text("Your Fitness Journey Starts Here")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Login Form
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                            TextField("Username", text: $username)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                        .padding(.horizontal)
                    
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                            if isSecured {
                                SecureField("Password", text: $password)
                            } else {
                                TextField("Password", text: $password)
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                        .padding(.horizontal)
                    }
                    
                    // Login Button
                    NavigationLink(destination: HomeView(isLoggedIn: $isLoggedIn), isActive: $isLoggedIn) {
                        HStack {
                            Image(systemName: "arrow.right.circle.fill")
                            Text("Start Working Out")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Or divider
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                        Text("OR")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    .padding(.horizontal)
                    
                    // Social Sign In Buttons
                    VStack(spacing: 10) {
                        Button(action: {
                            // Handle Google sign in
                        }) {
                            HStack {
                                Image(systemName: "g.circle.fill")
                                    .foregroundColor(.red)
                                Text("Continue with Google")
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5)
                        }
                        
                        Button(action: {
                            // Handle Apple sign in
                        }) {
                            HStack {
                                Image(systemName: "apple.logo")
                                Text("Continue with Apple")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Forgot Password & Sign Up Links
                    HStack {
                        Button("Forgot Password?") {
                            // Add forgot password action
                        }
                        .foregroundColor(.gray)
                        
                        Spacer()
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("New Member? Sign Up")
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.horizontal)
                    .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    ContentView()
}
