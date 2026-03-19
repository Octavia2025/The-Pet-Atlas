//
//  Dogs.swift
//  stack
//
//  Created by octavia on 17/3/2026.
//

import SwiftUI

// 1. Data model
struct DogBreed: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

// 2. New Detail View for Dog Considerations
struct DogConsiderationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text("What to know before getting a dog")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                Group {
                    InfoSection(title: "Exercise Needs", text: "Different breeds have different energy levels. A Border Collie needs hours of activity, while a French Bulldog might be happy with a short walk.")
                    InfoSection(title: "Grooming & Shedding", text: "Long-haired breeds like Goldens or Poodles require regular brushing and professional grooming to prevent matting.")
                    InfoSection(title: "Training & Socialization", text: "Dogs require consistent training and early socialization to become well-behaved companions.")
                    InfoSection(title: "Lifelong Commitment", text: "Dogs can live for 10-15 years. Consider the long-term costs of food, vet visits, and insurance.")
                    InfoSection(title: "Living Space", text: "Ensure your home is suitable for the dog's size. Some large dogs need yards, while others adapt well to apartments.")
                }
            }
            .padding()
        }
        .navigationTitle("Considerations")
    }
}

// Reusable Helper for the info text
struct InfoSection2: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).foregroundColor(.orange) // Using orange for dogs
            Text(text).font(.body).foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

struct DogsView: View {
    let breeds = [
        DogBreed(name: "Labrador Retriever", imageName: "Labrador Retriever", description: "Friendly, outgoing, intelligent, versatile, good with children"),
        DogBreed(name: "Golden Retriever", imageName: "Golden Retriever", description: "Gentle, loyal, intelligent, affectionate, good with children"),
        DogBreed(name: "Beagle", imageName: "Beagle", description: "Playful, energetic, curious, friendly, good with children"),
        DogBreed(name: "Poodle", imageName: "poodle", description: "Intelligent, trainable, loyal, affectionate, good with children"),
        DogBreed(name: "French Bulldog", imageName: "French bulldog", description: "Affectionate, playful, adaptable, good with children"),
        DogBreed(name: "Yorkshire Terrier", imageName: "Yorkshire Terrier 1", description: "Affectionate, playful, adaptable, good with children"),
        DogBreed(name: "Border Collie", imageName: "Boarder Collie", description: "Affectionate, playful, adaptable, good with children"),
        DogBreed(name: "Corgi", imageName: "Corgi", description: "Affectionate, playful, adaptable, good with children")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 25) {
                    ForEach(breeds) { breed in
                        DogCard(breed: breed)
                    }
                    
                    // --- THE NEW MENU BUTTON ---
                    NavigationLink(destination: DogConsiderationsView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Before You Buy")
                                    .font(.headline)
                                Text("Learn about exercise, grooming, and care")
                                    .font(.subheadline)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title2)
                        }
                        .padding()
                        .background(LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Dog Breeds")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct DogCard: View {
    let breed: DogBreed
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(breed.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(breed.name).font(.title3.bold())
                Text(breed.description)
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
    DogsView()
}
