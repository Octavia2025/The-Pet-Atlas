//
//  PetCompanion.swift
//  stack
//
//  Created by octavia on 15/4/2026.
//

import Foundation
import SwiftUI

struct PetSpecies: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let type: String
    let diet: String
    let lifespan: String
    let energyLevel: String
    let idealSpace: String
    let color: Color
    let icon: String // SF Symbol Name
    let description: String
}

struct PetCompanionView: View {
    // 1. Updated Data with SF Symbols
    let allPets = [
        PetSpecies(name: "Golden Retriever", type: "Dog", diet: "Kibble", lifespan: "12 yrs", energyLevel: "High", idealSpace: "House", color: .orange, icon: "dog.fill", description: "Friendly, reliable, and very kind."),
        PetSpecies(name: "Siamese Cat", type: "Cat", diet: "Wet Food", lifespan: "15 yrs", energyLevel: "High", idealSpace: "Apartment", color: .indigo, icon: "cat.fill", description: "Vocal, social, and very affectionate."),
        PetSpecies(name: "Bearded Dragon", type: "Reptile", diet: "Insects", lifespan: "15 yrs", energyLevel: "Low", idealSpace: "Apartment", color: .green, icon: "lizard.fill", description: "Docile and great for first-time owners."),
        PetSpecies(name: "Axolotl", type: "Amphibian", diet: "Worms", lifespan: "15 yrs", energyLevel: "Low", idealSpace: "Apartment", color: .purple, icon: "water.waves", description: "A unique salamander that lives underwater."),
        PetSpecies(name: "Holland Lop", type: "Rabbit", diet: "Hay", lifespan: "10 yrs", energyLevel: "Med", idealSpace: "Any", color: .pink, icon: "hare.fill", description: "Sweet-tempered with distinctive lopped ears."),
        PetSpecies(name: "Syrian Hamster", type: "Hamster", diet: "Seeds", lifespan: "3 yrs", energyLevel: "Med", idealSpace: "Apartment", color: .orange, icon: "circle.grid.3x3.fill", description: "Solitary but very active at night."),
        PetSpecies(name: "Betta Fish", type: "Fish", diet: "Pellets", lifespan: "5 yrs", energyLevel: "Low", idealSpace: "Apartment", color: .cyan, icon: "fish.fill", description: "Beautiful fins and very low maintenance.")
    ]
    
    @State private var selectedPet1: PetSpecies?
    @State private var selectedPet2: PetSpecies?
    @State private var searchText = ""
    @State private var favorites: Set<UUID> = []

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        
                        // --- DISCOVERY FEED ---
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Discovery Feed")
                                .font(.title3).bold()
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(allPets, id: \.self) { pet in
                                        DiscoveryCard(pet: pet, isFavorite: favorites.contains(pet.id)) {
                                            toggleFavorite(pet.id)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }

                        // --- COMPARISON SECTION ---
                        VStack(spacing: 20) {
                            HStack {
                                Image(systemName: "arrow.left.and.right.square.fill")
                                Text("Compare Species").bold()
                            }
                            .font(.headline)
                            .foregroundColor(.blue)
                            
                            HStack(spacing: 15) {
                                PetSelector(title: "Pet A", selection: $selectedPet1, list: allPets)
                                Text("VS").font(.caption).bold().foregroundColor(.secondary)
                                PetSelector(title: "Pet B", selection: $selectedPet2, list: allPets)
                            }
                            
                            if let p1 = selectedPet1, let p2 = selectedPet2 {
                                VStack(spacing: 1) {
                                    CompRow(label: "DIET", v1: p1.diet, v2: p2.diet)
                                    CompRow(label: "LIFESPAN", v1: p1.lifespan, v2: p2.lifespan)
                                    CompRow(label: "ENERGY", v1: p1.energyLevel, v2: p2.energyLevel)
                                    CompRow(label: "SPACE", v1: p1.idealSpace, v2: p2.idealSpace)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                        .padding(24)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black.opacity(0.05), radius: 10)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("PetWiki")
            .searchable(text: $searchText, prompt: "Search species...")
        }
    }
    
    func toggleFavorite(_ id: UUID) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }
}

// --- UI COMPONENTS ---

struct DiscoveryCard: View {
    let pet: PetSpecies
    let isFavorite: Bool
    let onFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: pet.icon)
                    .font(.title)
                    .foregroundColor(pet.color)
                Spacer()
                Button(action: onFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                }
            }
            Spacer()
            Text(pet.name).font(.headline)
            Text(pet.type).font(.caption).foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 150, height: 130)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.03), radius: 5)
    }
}

struct PetSelector: View {
    let title: String
    @Binding var selection: PetSpecies?
    let list: [PetSpecies]
    var body: some View {
        Menu {
            ForEach(list) { pet in
                Button(action: { selection = pet }) {
                    Label(pet.name, systemImage: pet.icon)
                }
            }
        } label: {
            VStack {
                Text(title).font(.caption2).bold().foregroundColor(.secondary)
                Text(selection?.name ?? "Choose")
                    .font(.subheadline).bold()
                    .foregroundColor(selection == nil ? .gray : .primary)
            }
            .frame(maxWidth: .infinity).padding(.vertical, 12)
            .background(Color(.systemGray6)).cornerRadius(12)
        }
    }
}

struct CompRow: View {
    let label: String
    let v1: String
    let v2: String
    var body: some View {
        HStack {
            Text(v1).frame(maxWidth: .infinity).font(.system(size: 13, weight: .medium))
            Text(label).font(.system(size: 8, weight: .black)).foregroundColor(.blue).frame(width: 60)
            Text(v2).frame(maxWidth: .infinity).font(.system(size: 13, weight: .medium))
        }
        .padding(.vertical, 14)
        .background(Color(.systemGray6).opacity(0.3))
    }
}

#Preview {
    PetCompanionView()
}
