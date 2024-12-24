import SwiftUI

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView {
            // Dashboard Tab
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Workouts Tab
            WorkoutListView()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Workouts")
                }
            
            // Profile Tab
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.green)
        .navigationBarBackButtonHidden(true)
    }
}

// Dashboard View with fitness stats
struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Today's Stats Card
                    VStack(spacing: 15) {
                        HStack {
                            Text("Today's Progress")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("March 19")
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 20) {
                            StatCard(title: "Steps", value: "8,439", icon: "figure.walk")
                            StatCard(title: "Calories", value: "487", icon: "flame.fill")
                            StatCard(title: "Minutes", value: "47", icon: "clock.fill")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    // Weekly Progress Chart
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weekly Activity")
                            .font(.title2)
                            .bold()
                        
                        // Mock Chart
                        HStack(alignment: .bottom, spacing: 15) {
                            ForEach(0..<7) { index in
                                VStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.green.opacity(0.7))
                                        .frame(width: 30, height: CGFloat.random(in: 50...150))
                                    Text(["M", "T", "W", "T", "F", "S", "S"][index])
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .frame(height: 150)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    // Recent Workouts
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Recent Workouts")
                            .font(.title2)
                            .bold()
                        
                        ForEach(["Running", "Weight Training", "Yoga"], id: \.self) { workout in
                            HStack {
                                Circle()
                                    .fill(Color.green.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: workout == "Running" ? "figure.run" :
                                                workout == "Weight Training" ? "dumbbell.fill" : "figure.mind.and.body")
                                            .foregroundColor(.green)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text(workout)
                                        .font(.headline)
                                    Text("2 hours ago")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text(workout == "Running" ? "3.2 km" :
                                        workout == "Weight Training" ? "45 min" : "30 min")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                    }
                    .padding()
                }
                .padding()
            }
            .background(Color.gray.opacity(0.1))
            .navigationTitle("Dashboard")
        }
    }
}

// Profile View
struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Profile Header with Cover Photo
                ZStack(alignment: .bottom) {
                    // Cover Photo
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.green.opacity(0.7), .blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                        .frame(height: 150)
                    
                    // Profile Picture
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.green))
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .offset(y: 60)
                }
                
                // Name and Bio
                VStack(spacing: 8) {
                    Text("Alex Johnson")
                        .font(.title)
                        .bold()
                        .padding(.top, 60)
                    
                    Text("🏃‍♂️ Fitness Enthusiast | 💪 Personal Trainer")
                        .foregroundColor(.gray)
                    
                    Text("Helping others achieve their fitness goals. Marathon runner and CrossFit enthusiast.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 5)
                }
                
                // Stats Summary
                HStack(spacing: 30) {
                    VStack {
                        Text("156")
                            .font(.title2)
                            .bold()
                        Text("Workouts")
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("28")
                            .font(.title2)
                            .bold()
                        Text("Day Streak")
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("847")
                            .font(.title2)
                            .bold()
                        Text("Hours")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                
                // Achievements
                VStack(alignment: .leading, spacing: 15) {
                    Text("Achievements")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            AchievementCard(icon: "flame.fill", title: "10K Steps", subtitle: "30 Days Streak", color: .orange)
                            AchievementCard(icon: "trophy.fill", title: "Marathon", subtitle: "Completed", color: .yellow)
                            AchievementCard(icon: "star.fill", title: "Top Performer", subtitle: "This Month", color: .purple)
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Settings List
                VStack(alignment: .leading, spacing: 15) {
                    SettingsRow(icon: "person.fill", title: "Edit Profile")
                    SettingsRow(icon: "gear", title: "Settings")
                    SettingsRow(icon: "bell.fill", title: "Notifications")
                    SettingsRow(icon: "heart.fill", title: "Health Data")
                    SettingsRow(icon: "target", title: "Goals")
                    
                    Divider()
                        .padding(.vertical, 5)
                    
                    Button(action: {
                        isLoggedIn = false
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.red)
                                .font(.title3)
                            Text("Sign Out")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.1))
        .navigationTitle("Profile")
        .navigationBarItems(trailing: Button(action: {
            // Handle edit profile
        }) {
            Image(systemName: "square.and.pencil")
                .foregroundColor(.green)
        })
    }
}

// Workouts List View
struct WorkoutListView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Suggested Workouts")) {
                    WorkoutRow(name: "Morning Run", duration: "30 min", intensity: "Medium")
                    WorkoutRow(name: "Full Body Strength", duration: "45 min", intensity: "High")
                    WorkoutRow(name: "Yoga Flow", duration: "20 min", intensity: "Low")
                }
                
                Section(header: Text("Your Programs")) {
                    WorkoutRow(name: "5K Training", duration: "8 weeks", intensity: "Variable")
                    WorkoutRow(name: "Strength Builder", duration: "12 weeks", intensity: "High")
                }
            }
            .navigationTitle("Workouts")
        }
    }
}

// Helper Views
struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.green)
            Text(value)
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 30)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct WorkoutRow: View {
    let name: String
    let duration: String
    let intensity: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .font(.headline)
            HStack {
                Text(duration)
                Text("•")
                Text(intensity)
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

// Add this new helper view for achievements
struct AchievementCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            
            Text(title)
                .font(.subheadline)
                .bold()
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 120, height: 120)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
} 