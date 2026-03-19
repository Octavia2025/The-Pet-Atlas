//
//  ContentView.swift
//  stack
//
//  Created by Octavia Mucheche on 6/12/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("pet")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    // Darkens the image slightly so white text pops
                    .overlay(Color.black.opacity(0.35))
                
                VStack(spacing: 12) {
                    Spacer() // Pushes content to the bottom
                    
                    Text("World of Pets")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                   
                    Text("Find your perfect companion.")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(radius: 5)
                    
                    
                    NavigationLink(destination: DifferentPets()) {
                        HStack {
                            Text("Get Started")
                                .font(.headline)
                            Image(systemName: "pawprint.fill")
                        }
                        .padding()
                        .frame(width: 220)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                    }
                    .padding(.top, 25)
                    .padding(.bottom, 60) // Extra space at the very bottom
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
