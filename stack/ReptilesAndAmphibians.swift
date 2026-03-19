//
//  ReptilesAndAmphibians.swift
//  stack
//
//  Created by octavia on 19/3/2026.
//

import SwiftUI

// 1. Data model for Reptiles & Amphibians
struct HerpBreed: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

// 2. New Detail View for Reptile/Amphibian Considerations
struct HerpConsiderationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text("Habitat & Husbandry")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                Group {
                    HerpInfoSection(title: "Temperature & Lighting", text: "Most reptiles require a 'thermal gradient' (a hot side and a cool side) and specific UVB lighting to process calcium and stay healthy.")
                    HerpInfoSection(title: "Humidity Control", text: "Tropical species like Tree Frogs need high humidity, while desert species like Bearded Dragons need dry air. Misting systems or hygrometers are essential.")
                    HerpInfoSection(title: "Dietary Needs", text: "Many of these pets eat live insects (crickets, dubia roaches) or frozen-thawed rodents. Ensure you are comfortable handling these food sources.")
                    HerpInfoSection(title: "Lifespan", text: "Reptiles are a long-term commitment. Ball Pythons and Leopard Geckos can live 20+ years, and Axolotls can live up to 15 years.")
                    HerpInfoSection(title: "Salmonella Risk", text: "All reptiles and amphibians can carry Salmonella. Always wash your hands thoroughly after handling them or cleaning their habitats.")
                }
            }
            .padding()
        }
        .navigationTitle("Considerations")
    }
}

// Reusable Helper for the info text
struct HerpInfoSection: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).foregroundColor(.red) // Red/Orange theme for heat-seeking pets
            Text(text).font(.body).foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

struct ReptilesAndAmphibiansView: View {
    let reptiles = [
        HerpBreed(name: "Leopard Geckos", imageName: "Leopard Geckos", description: "Docile, easy to handle, and manageable in size. They are hardy and tolerate beginner mistakes well."),
        HerpBreed(name: "Bearded Dragons", imageName: "Bearded Dragons", description: "Popular for their docile temperament and unique appearance. They make fascinating educational companions."),
        HerpBreed(name: "Corn Snakes", imageName: "Corn Snakes", description: "A classic beginner snake with a calm nature and manageable size. They come in many striking colors."),
        HerpBreed(name: "Crested Geckos", imageName: "Crested Geckos", description: "Arboreal lizards with sticky toe pads for climbing. Easy to care for and very active."),
        HerpBreed(name: "Ball Pythons", imageName: "Ball Pythons", description: "Known for a very calm demeanor and passive nature. They have easy care requirements and stay a manageable size.")
    ]
    
    let amphibians = [
        HerpBreed(name: "Axolotls", imageName: "Axolotls", description: "Fascinating aquatic salamanders that keep their gills for life. Fun to observe in a specialized water tank."),
        HerpBreed(name: "Pacman Frogs", imageName: "Pacman Frogs", description: "Large, colorful frogs known for their voracious appetites. Low-maintenance and unique-looking."),
        HerpBreed(name: "White's Tree Frogs", imageName: "White's Tree Frogs", description: "Also known as 'Dumpy' tree frogs. Very docile, easy to care for, and have a friendly appearance."),
        HerpBreed(name: "Red-eyed Tree Frogs", imageName: "Red-eyed Tree Frogs", description: "Striking colors and iconic appearance. A beautiful addition to a bioactive terrarium setup."),
        HerpBreed(name: "Oriental Fire-Bellied Toads", imageName: "Oriental Fire-Bellied Toads", description: "Vibrant colors and relatively easy care. A great choice for those new to keeping amphibians.")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 25) {
                    
                    Text("Reptiles")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ForEach(reptiles) { herp in
                        HerpCard(herp: herp)
                    }
                    
                    Text("Amphibians")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(amphibians) { herp in
                        HerpCard(herp: herp)
                    }
                    
                    
                    NavigationLink(destination: HerpConsiderationsView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Habitat & Setup Tips")
                                    .font(.headline)
                                Text("Learn about heat, lighting, and diet")
                                    .font(.subheadline)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "thermometer.sun.fill")
                                .font(.title2)
                        }
                        .padding()
                        .background(LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Scales & Slimy")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct HerpCard: View {
    let herp: HerpBreed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(herp.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 190)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(herp.name)
                    .font(.title3.bold())
                
                Text(herp.description)
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
    ReptilesAndAmphibiansView()
}
