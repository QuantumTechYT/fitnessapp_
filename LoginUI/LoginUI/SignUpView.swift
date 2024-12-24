import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSecured = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Text("Start your fitness journey today")
                        .foregroundColor(.gray)
                    
                    VStack(spacing: 15) {
                        // Full Name Field
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                            TextField("Full Name", text: $fullName)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                        
                        // Email Field
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                        
                        // Password Field
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
                        
                        // Confirm Password Field
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                            SecureField("Confirm Password", text: $confirmPassword)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Sign Up Button
                    Button(action: {
                        // Handle sign up
                    }) {
                        Text("Create Account")
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
                    
                    // Terms and Conditions
                    Text("By signing up, you agree to our Terms of Service and Privacy Policy")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Back to Login Button
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Back to Login")
                        }
                        .foregroundColor(.gray)
                        .padding(.top)
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.green)
                }
            }
        }
    }
} 