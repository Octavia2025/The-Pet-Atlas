//
//  Dogs.swift
//  stack
//
//  Created by octavia on 17/3/2026.
//

import SwiftUI // Required for View and Image

struct DogsView: View {
    var body: some View {
        NavigationStack { // Only one stack needed
            ScrollView {
                VStack(spacing: 20) { // Groups items and adds spacing
                    
                    Image("Labrador Retriever") // Removed trailing space in name
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Labrador Retrievers - Friendly, outgoing, intelligent, versatile, good with children")
                    
                    Image("Golden Retriever")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Golden Retrievers - Gentle, loyal, intelligent, affectionate, good with children")
                    
                    Image("Beagle")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Beagles - Playful, energetic, curious, friendly, good with children")
                    
                    Image("poodle")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Poodle - Intelligent, trainable, loyal, affectionate, good with children")
                    
                    Image("French bulldog")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("French Bulldog - Affectionate, playful, adaptable, good with children")
                    
                    Image("Yorkshire Terrier 1")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Yorkshire Terrier - Affectionate, playful, adaptable, good with children")
                    
                    Image("Boarder Collie")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Border Collie - Affectionate, playful, adaptable, good with children")
                    
                    Image("Corgi")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Corgi - Affectionate, playful, adaptable, good with children")
                }
                
            }
            .navigationTitle("Dog Breeds") // Optional header
        }
    }
}

#Preview {
    DogsView()
}
