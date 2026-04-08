//
//  Pets.swift
//  stack
//
//  Created by octavia on 19/3/2026.
//


import SwiftUI

struct DifferentPets: View {
    // Define the categories to keep the body clean
    let categories = [
        PetCategory(name: "Dogs", icon: "dog.fill", color: .orange, destination: AnyView(DogsView())),
        PetCategory(name: "Cats", icon: "cat.fill", color: .purple, destination: AnyView(CatsView())),
        PetCategory(name: "Rabbits & Hamsters", icon: "hare.fill", color: .blue, destination: AnyView(RabbitsAndHamstersView())),
        PetCategory(name: "Birds", icon: "bird.fill", color: .cyan, destination: AnyView(BirdsView())),
        PetCategory(name: "Fish", icon: "fish.fill", color: .teal, destination: AnyView(FishView())),
        PetCategory(name: "Reptiles", icon: "tortoise.fill", color: .green, destination: AnyView(ReptilesAndAmphibiansView()))
    ]
    
    // Two-column layout
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome!")
                        .font(.largeTitle.bold())
                    
                    Text("Choose a pet category to explore and learn about your future companion.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(categories) { category in
                            NavigationLink(destination: category.destination) {
                                CategoryCard(category: category)
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
            .navigationTitle("Pet Guide")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

// MARK: - Category Card UI
struct CategoryCard: View {
    let category: PetCategory
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: category.icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            Text(category.name)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(category.color.gradient) // Uses a nice subtle gradient
        )
        .shadow(color: category.color.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Data Model
struct PetCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let destination: AnyView
}

#Preview {
    DifferentPets()
}
