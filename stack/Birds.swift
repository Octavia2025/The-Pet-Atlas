//
//  Birds.swift
//  stack
//
//  Created by octavia on 19/3/2026.
//

import SwiftUI

// MARK: - Data Models
struct PetBreed: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

// MARK: - Shared Components
struct BreedCard: View {
    let pet: PetBreed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Updated image section to prevent cutting off bird images
            ZStack {
                Color(.secondarySystemBackground) // Light gray backdrop for the image area
                
                Image(pet.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Changed from .fill to .fit so NO parts are cut off
                    .frame(height: 220)
                    .padding(10) // Small padding so birds don't touch the very edge
            }
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(pet.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(pet.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// MARK: - Detail View for Considerations
struct ConsiderationsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text("What to know before buying")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                Group {
                    InfoSection(title: "Time Commitment", text: "Larger parrots like macaws and cockatoos require a significant time commitment for socialization and care.")
                    InfoSection(title: "Space Requirements", text: "Larger birds need spacious enclosures and may also need time outside of the cage.")
                    InfoSection(title: "Noise Levels", text: "Some birds, like certain conures and cockatoos, can be quite vocal.")
                    InfoSection(title: "Social Needs", text: "Consider whether the bird will be kept alone or in a group, as some species prefer the company of their own kind.")
                    InfoSection(title: "Temperament", text: "Research the specific temperament to ensure it aligns with your lifestyle.")
                }
            }
            .padding()
        }
        .navigationTitle("Considerations")
    }
}

struct InfoSection: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).foregroundColor(.blue)
            Text(text).font(.body).foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

// MARK: - Main Birds View
struct BirdsView: View {
    let beginners = [
        PetBreed(name: "Budgerigars (Parakeets)", imageName: "Budgerigars (Parakeets)", description: "Small, social birds known for being easy to train and bond with. They can learn to mimic sounds and phrases, and they are relatively low-maintenance."),
        PetBreed(name: "Cockatiels", imageName: "Cockatiels", description: "Cockatiels are known for their friendly and affectionate nature, enjoying head scratches and spending time with their owners."),
        PetBreed(name: "Canaries", imageName: "Canaries", description: "These birds are great for those who appreciate songbirds and don't necessarily need a bird that requires a lot of handling."),
        PetBreed(name: "Finches", imageName: "Finches", description: "Similar to canaries, finches are relatively low-maintenance and enjoy the company of other finches.")
    ]
    
    let others = [
        PetBreed(name: "Lovebirds", imageName: "Lovebirds", description: "These are small, active parrots known for their affectionate nature and playful personalities."),
        PetBreed(name: "Pionus Parrots", imageName: "Pionus Parrots", description: "These parrots are known for being affectionate while still maintaining their independence."),
        PetBreed(name: "Conures", imageName: "Conures", description: "While some conures can be noisy, they can also be very affectionate and playful."),
        PetBreed(name: "Parrotlets", imageName: "Parrotlets", description: "These small parrots are known for their big personalities and can be great companions.")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    
                    Text("Beginner-Friendly Birds")
                        .font(.title2.bold())
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(beginners) { bird in
                        BreedCard(pet: bird)
                    }
                    
                    Text("Other Pet Birds")
                        .font(.title2.bold())
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(others) { bird in
                        BreedCard(pet: bird)
                    }
                    
                    // Navigation Menu Link
                    NavigationLink(destination: ConsiderationsDetailView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Important Considerations")
                                    .font(.headline)
                                Text("Learn about time, space, and noise needs")
                                    .font(.subheadline)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title2)
                        }
                        .padding()
                        .background(LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 30)
                    }
                }
            }
            .navigationTitle("Birds")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

#Preview {
    BirdsView()
}
