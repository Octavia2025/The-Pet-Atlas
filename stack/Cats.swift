//
//  Cats.swift
//  stack
//
//  Created by octavia on 18/3/2026.
//

import SwiftUI

// 1. Data model for Cats
struct CatBreed: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

// 2. New Detail View for Cat Considerations
struct CatConsiderationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text("What to know before adopting a cat")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                Group {
                    CatInfoSection(title: "Grooming Needs", text: "Long-haired cats like Persians and Maine Coons need daily brushing to prevent mats. Even short-haired cats shed and benefit from weekly grooming.")
                    CatInfoSection(title: "Indoor Safety", text: "Indoor cats live longer, safer lives. Consider 'cat-proofing' your home by removing toxic plants like lilies and securing window screens.")
                    CatInfoSection(title: "Scratching Instincts", text: "Scratching is a natural behavior. Provide sturdy scratching posts to protect your furniture.")
                    CatInfoSection(title: "Social Interaction", text: "While independent, cats still need daily play and affection. Some breeds, like the Siamese or Sphynx, are extremely social.")
                    CatInfoSection(title: "Litter Box Care", text: "Cats are very clean animals. Maintaining a tidy litter box is essential for their health and happiness.")
                }
            }
            .padding()
        }
        .navigationTitle("Considerations")
    }
}

// Reusable Helper for the info text
struct CatInfoSection: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).foregroundColor(.purple) // Purple theme for cats
            Text(text).font(.body).foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

struct CatsView: View {
    let catBreeds = [
        CatBreed(name: "Ragdoll", imageName: "Ragdoll 1", description: "Known for their docile personalities, they are puppy-like and love being held. Great with children and other pets."),
        CatBreed(name: "Maine Coon", imageName: "Maine Coon", description: "Often called 'gentle giants,' these large cats are friendly, affectionate, and playful. They even get along well with dogs."),
        CatBreed(name: "Persian", imageName: "Persian", description: "Known for luxurious coats and a calm demeanor. They are ideal lap cats but require regular grooming."),
        CatBreed(name: "Siamese", imageName: "Siamese", description: "Famous for intelligence and vocalizations. They are very social and deeply attached to their owners."),
        CatBreed(name: "Sphynx", imageName: "Sphynx", description: "These hairless cats are outgoing and crave human interaction. They love to cuddle and stay by your side."),
        CatBreed(name: "Abyssinian", imageName: "Abyssinian", description: "Playful and curious, these active cats love exploring and interacting with their environment."),
        CatBreed(name: "Burmese", imageName: "Burmese", description: "Affectionate and social cats that enjoy being around people. They are notably intelligent and trainable."),
        CatBreed(name: "Scottish Fold", imageName: "Scottish Fold", description: "Known for their sweet, gentle nature and signature folded ears. They are low-maintenance and loving.")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 25) {
                    ForEach(catBreeds) { cat in
                        CatCard(cat: cat)
                    }
                    
                    // --- THE PURPLE MENU BUTTON ---
                    NavigationLink(destination: CatConsiderationsView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Cat Care Essentials")
                                    .font(.headline)
                                Text("Learn about grooming, safety, and habits")
                                    .font(.subheadline)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title2)
                        }
                        .padding()
                        .background(LinearGradient(colors: [.purple, .indigo], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Cats")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct CatCard: View {
    let cat: CatBreed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(cat.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 240)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(cat.name)
                    .font(.title3.bold())
                
                Text(cat.description)
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
    CatsView()
}
