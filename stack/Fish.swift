//
//  Fish.swift
//  stack
//
//  Created by octavia on 19/3/2026.
//

import SwiftUI

// 1. Data model for Fish
struct FishBreed: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

// 2. New Detail View for Fish Considerations
struct FishConsiderationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text("Essential Tank Care")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                Group {
                    FishInfoSection(title: "The Nitrogen Cycle", text: "Before adding fish, you must 'cycle' your tank to establish healthy bacteria that break down harmful waste.")
                    FishInfoSection(title: "Water Parameters", text: "Regular testing of pH, ammonia, and nitrate levels is vital. Each species has specific temperature and water hardness needs.")
                    FishInfoSection(title: "Tank Size", text: "Don't underestimate space! Even 'small' goldfish need large tanks because they produce a lot of waste.")
                    FishInfoSection(title: "Compatibility", text: "Some fish are aggressive (like Bettas) or fin-nippers. Always research which species can live peacefully together.")
                    FishInfoSection(title: "Maintenance", text: "Expect to do weekly 20-25% water changes and clean the glass and gravel to keep the environment healthy.")
                }
            }
            .padding()
        }
        .navigationTitle("Considerations")
    }
}

// Reusable Helper for the info text
struct FishInfoSection: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).foregroundColor(.green) // Green theme for fish/water
            Text(text).font(.body).foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

struct FishView: View {
    let beginners = [
        FishBreed(name: "Goldfish", imageName: "Goldfish", description: "A classic choice, goldfish are relatively low-maintenance and come in many varieties."),
        FishBreed(name: "Guppies", imageName: "Guppies", description: "Vibrant, small, and active. They are livebearers that make great additions to community tanks."),
        FishBreed(name: "Platies", imageName: "Platies", description: "Peaceful fish that come in a wide array of colors. Very easy for beginners to care for."),
        FishBreed(name: "Mollies", imageName: "Mollies", description: "Hardy fish that come in various types, including black and sailfin. Great for community setups."),
        FishBreed(name: "Swordtails", imageName: "Swordtails", description: "Known for their slender bodies and the distinctive sword-like tail extension on males."),
        FishBreed(name: "Betta Fish", imageName: "Betta Fish", description: "Beautiful and vibrant. They are easy to care for but typically must be kept alone."),
        FishBreed(name: "Tetras", imageName: "Tetras", description: "Small schooling fish, like Neon Tetras, that look stunning when kept in groups.")
    ]
    
    let experienced = [
        FishBreed(name: "Zebra Danios", imageName: "Zebra Danios", description: "Active, hardy, and social. They are great for community tanks with a bit more movement."),
        FishBreed(name: "Corydoras Catfish", imageName: "Corydoras Catfish", description: "Peaceful bottom-dwellers that help keep the tank clean by eating leftover food."),
        FishBreed(name: "Angelfish", imageName: "Angelfish", description: "Graceful and majestic, but require larger tanks and specific water conditions as they grow.")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 25) {
                    
                    Text("Beginner-Friendly Fish")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ForEach(beginners) { fish in
                        FishCard(fish: fish)
                    }
                    
                    Text("More Experienced Keepers")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(experienced) { fish in
                        FishCard(fish: fish)
                    }
                    
                    // --- THE GREEN MENU BUTTON ---
                    NavigationLink(destination: FishConsiderationsView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Aquarium Success Tips")
                                    .font(.headline)
                                Text("Learn about cycling, water, and tank size")
                                    .font(.subheadline)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title2)
                        }
                        .padding()
                        .background(LinearGradient(colors: [.green, .teal], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Fish")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct FishCard: View {
    let fish: FishBreed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(fish.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(fish.name)
                    .font(.title3.bold())
                
                Text(fish.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}

#Preview {
    FishView()
}
