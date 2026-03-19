//
//  RabbitsAndHamsters.swift
//  stack
//
//  Created by octavia on 18/3/2026.
//

import SwiftUI

// 1. Data model for the small pets
struct SmallPet: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

struct RabbitsAndHamstersView: View {
    // 2. Lists split into two categories
    let rabbits = [
        SmallPet(name: "Holland Lop", imageName: "Holland Lop", description: "Known for their small size and floppy ears, they are generally friendly and affectionate."),
        SmallPet(name: "Mini Lop", imageName: "Mini Lop", description: "Similar to the Holland Lop, they are also relatively small and known for their docile nature."),
        SmallPet(name: "Lionhead", imageName: "Lionhead", description: "These rabbits have a distinctive mane of fur around their head, and they are generally friendly and playful."),
        SmallPet(name: "Dutch", imageName: "Dutch", description: "Known for their distinctive markings and their calm nature, making them a good choice for families.")
    ]
    
    let hamsters = [
        SmallPet(name: "Syrian Hamster", imageName: "Syrian Hamster", description: "Also known as the Golden Hamster, these are popular for first-time owners due to their docile nature."),
        SmallPet(name: "Roborovski Dwarf Hamster", imageName: "Roborovski Dwarf Hamster", description: "The smallest of the commonly kept hamsters, they are known for their incredible speed and activity."),
        SmallPet(name: "Chinese Hamster", imageName: "Chinese Hamster", description: "A popular choice for first-time pet owners due to their docile nature and ease of handling.")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    
                    // --- Rabbits Section ---
                    Text("Rabbits")
                        .font(.title.bold())
                        .padding(.horizontal)
                    
                    ForEach(rabbits) { pet in
                        PetCard(pet: pet)
                    }
                    
                    Divider().padding(.vertical)
                    
                    // --- Hamsters Section ---
                    Text("Hamsters")
                        .font(.title.bold())
                        .padding(.horizontal)
                    
                    ForEach(hamsters) { pet in
                        PetCard(pet: pet)
                    }
                }
                .padding()
            }
            .navigationTitle("Small Pets")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

// 3. Reusable Card View
struct PetCard: View {
    let pet: SmallPet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(pet.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 350)
                .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(pet.name)
                    .font(.headline)
                
                Text(pet.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    RabbitsAndHamstersView()
}
