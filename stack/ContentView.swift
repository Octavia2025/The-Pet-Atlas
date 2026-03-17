//
//  ContentView.swift
//  stack
//
//  Created by Octavia Mucheche on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("pet")
                    .resizable()
                    .imageScale(.medium)
                    .foregroundStyle(.tint)
                    .ignoresSafeArea()
                Text("Welcome to the world of pets")
                
                NavigationLink("Next") {
                    DifferentPets()
                    
                }
            }
            .padding()
            
        }
    }
}
struct DifferentPets: View {
    var body: some View {
        NavigationStack {
            
            List{
                NavigationLink("Dogs"){DogsView()}
                NavigationLink("Cats"){Cats()}
                NavigationLink("Rabbits and hamsters"){RabbitsAndHamsters()}
                NavigationLink("Birds"){Birds()}
                NavigationLink("Fish"){Fish()}
                NavigationLink("Reptiles and Amphibians"){ReptilesAndAmphibians()}
            }
            
        }
    }
}

//struct Dogs: View {
//    var body: some View {
//        NavigationStack{
//            NavigationStack{
//               ScrollView{
//                    Image("Labrador Retriever ")
//                        .resizable()
//                        .frame(width:200, height: 200)
//                    Text("Labrador Retrievers -  Friendly, outgoing, intelligent, versatile, good with children ")
//                    
//                    
//                    Image("Golden Retriever")
//                        .resizable()
//                        .frame(width:200, height: 200)
//                    Text("Golden Retrievers -  Gentle, loyal, intelligent, affectionate, good with children")
//                        .padding(.top)
//                    Image("Beagle")
//                        .resizable()
//                        .frame(width:200, height: 200)
//                    Text("Beagles -  Playful, energetic, curious, friendly, good with children")
//                        .padding(.bottom)
//                    Image("poodle")
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                    Text(" Poodle - Intelligent, trainable, loyal, affectionate, good with children")
//                        .padding(.bottom)
//                    Image("French bulldog")
//                        .resizable()
//                        .frame(width:200, height: 200)
//                    Text(" French Bulldog - Affectionate, playful, adaptable, good with children")
//                        .padding(.bottom)
//                    Image("Yorkshire Terrier 1")
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                    Text("* Yorkshire Terrier - Affectionate, playful, adaptable, good with children")
//                        .padding(.bottom)
//                    
//                    Image("Boarder Collie")
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                    Text("Boarder Collie - Affectionate, playful, adaptable, good with children")
//                        .padding(.bottom)
//                    
//                    Image("Corgi")
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                    Text("Corgi - Affectionate, playful, adaptable, good with children")
//                        .padding(.bottom)
//                   
//                  
//                    
//                    
//                    
//                    
//                }
//            }
//        }
//    }
//}




struct Cats: View{
    var body: some View {
        NavigationView {
            NavigationStack{
                ScrollView{
                    Image("Ragdoll 1")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Ragdoll-These cats are known for their docile and relaxed personalities. They are often described as puppy-like due to their tendency to follow their owners around and their love for being held. They are also generally good with children and other pets.")
                        .padding(.bottom)
                    Image("Maine Coon")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Maine Coon - Often called gentle giants Maine Coons are large, friendly cats that are known for being affectionate and playful. They are great with families and can even get along well with dogs.")
                        .padding(.bottom)
                    Image("Persian")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Persian - Persians are known for their luxurious coats and calm, quiet demeanor. They are often content to lounge around and be petted, making them ideal lap cats. They do require regular grooming to maintain their coat.")
                        .padding(.bottom)
                    Image("Siamese")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Siamese - Siamese cats are known for their intelligence, vocalizations, and social nature. They are very attached to their owners and enjoy interacting with them, making them a great choice for those who want an engaging and playful companion. ")
                        .padding(.bottom)
                    Image("Sphynx")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Sphynx - These hairless cats are known for their affectionate and outgoing personalities. They crave human interaction and love to cuddle, making them excellent companions for those who want a cat that is always by their side.")
                        .padding(.bottom)
                    Image("Abyssinian")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Abyssinian - These cats are known for their playful and curious nature. They are very active and enjoy exploring their environment. They also tend to be very social and enjoy interacting with their owners.")
                        .padding(.bottom)
                    Image("Burmese")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Burmese - Burmese cats are known for their affectionate and playful personalities. They are very social and enjoy being around people. They are also known for being intelligent and trainable.")
                        .padding(.bottom)
                    Image("Scottish Fold")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Scottish Fold - These cats are known for their sweet and gentle nature. They are relatively low-maintenance and enjoy spending time with their owners.")
                        .padding(.bottom)
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
struct RabbitsAndHamsters: View{
    var body: some View {
        //NavigationView {
            NavigationStack{
                ScrollView{
                    Text("Rabbits:")
                        .font(.title)
                        
                    Image("Holland Lop")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Holland Lop- Known for their small size and floppy ears, they are generally friendly and affectionate, making them good companions  .")
                        .padding(.bottom)
                    
                    Image("Mini Lop")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Mini Lop - Similar to the Holland Lop, they are also relatively small and known for their docile nature.")
                        .padding(.bottom)
                    
                    Image("Lionhead")
                        .resizable()
                        .frame(width:220, height: 220)
                    Text("Lionhead - These rabbits have a distinctive mane of fur around their head, and they are generally friendly and playful.")
                        .padding(.bottom)
                    
                    Image("Dutch")
                        .resizable()
                        .frame(width:220, height: 220)
                    Text("Dutch - Dutch rabbits are known for their distinctive markings and their calm and friendly nature, which makes them a good choice for families with children.")
                        .padding(.bottom)
                    
                    Text("Hamsters:")
                        .font(.title)
                        
                    Image("Syrian Hamster")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Syrian Hamster - Also known as the Golden Hamster, these are a popular choice for first-time pet owners due to their docile nature and ease of handling.")
                        .padding(.bottom)
                    
                    Image("Roborovski Dwarf Hamster")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Roborovski Dwarf Hamster - The smallest of the commonly kept hamsters, they are known for their speed and activity.")
                        .padding(.bottom)
                    
                    Image("Chinese Hamster")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Chinese Hamster -Also known as the Golden Hamster, these are a popular choice for first-time pet owners due to their docile nature and ease of handling.")
                        .padding(.bottom)
                    
                    
                    
                    
                    
                }
            }
        }
    }
//}
struct Birds: View{
    var body: some View {
        NavigationView {
            NavigationStack{
                ScrollView{
                    Text("Beginner-Friendly Birds")
                        .font(.title)
                        
                    Image("Budgerigars (Parakeets)")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Budgerigars (Parakeets)- These small, social birds are known for being easy to train and bond with. They can learn to mimic sounds and phrases, and they are relatively low-maintenance.")
                        .padding(.bottom)
                    
                    Image("Cockatiels")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Cockatiels: Cockatiels are known for their friendly and affectionate nature, enjoying head scratches and spending time with their owners.")
                        .padding(.bottom)
                    
                    Image("Canaries")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Canaries: These birds are great for those who appreciate songbirds and don't necessarily need a bird that requires a lot of handling.")
                        .padding(.bottom)
                    
                    Image("Finches")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Finches : Similar to canaries, finches are relatively low-maintenance and enjoy the company of other finches.")
                        .padding(.bottom)
                    
                    Text("Other Pet Birds")
                        .font(.title)
                        
                    Image("Lovebirds")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Lovebirds : These are small, active parrots known for their affectionate nature and playful personalities.")
                        .padding(.bottom)
                    
                    Image("Pionus Parrots")
                        .resizable()
                        .frame(width: 250, height: 300)
                    Text("Pionus Parrots: These parrots are known for being affectionate while still maintaining their independence.")
                        .padding(.bottom)
                    
                    Image("Conures")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Conures: While some conures can be noisy, they can also be very affectionate and playful.")
                        .padding(.bottom)
                    
                    Image("Parrotlets")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Parrotlets: These small parrots are known for their big personalities and can be great companions.")
                        .padding(.bottom)
                    
                    Text("Considerations when choosing a pet bird:")
                        .font(.largeTitle)
                        .padding(.bottom)
                    Text("Time Commitment:  Larger parrots like macaws and cockatoos require a significant time commitment for socialization and care.  Space Requirements:  Larger birds need spacious enclosures and may also need time outside of the cage.      Noise Levels:  Some birds, like certain conures and cockatoos, can be quite vocal.      Social Needs:  Consider whether the bird will be kept alone or in a group, as some species prefer the company of their own kind.   Temperament:  Research the specific temperament of the bird breed you are interested in to ensure it aligns with your lifestyle and experience. ")
                        .fontDesign(.serif)
                        .padding(.bottom)
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
struct Fish: View{
    var body: some View {
        NavigationView {
            NavigationStack{
                ScrollView{
                    Text("Beginner-Friendly Fish")
                        .font(.title)
                        
                    Image("Goldfish")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Goldfish: A classic choice, goldfish are relatively low-maintenance and come in many varieties.")
                        .padding(.bottom)
                    
                    Image("Guppies")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Guppies: Small, colorful, and breed easily, making them fun to watch develop. Known for their vibrant colors and livebearing nature, guppies are a great option for community tanks.")
                        .padding(.bottom)
                    
                    Image("Platies")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Platies: Similar to guppies, but come in a wider array of colors and patterns. These small, peaceful fish are easy to care for and come in a wide array of colors.")
                        .padding(.bottom)
                    
                    Image("Mollies")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Mollies : Mollies are another popular choice for community tanks.Hardy and come in various types, including black mollies and sailfin mollies. ")
                        .padding(.bottom)
                
                    Image("Swordtails")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Swordtails : These livebearers are known for their slender bodies and the distinctive sword extension on the males' tails.")
                        .padding(.bottom)
                    
                    Image("Betta Fish")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Betta Fish: Beautiful, vibrant, and relatively easy to care for, but typically kept alone.")
                        .padding(.bottom)
                    
                    Image("Tetras")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Tetras: A group of small schooling fish, including popular choices like neon tetras.")
                        .padding(.bottom)
                    
                    
                    Text("Fish for More Experienced Keepers")
                        .font(.title)
                        .padding(.bottom)
                    Image("Zebra Danios")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Zebra Danios:  Active and hardy, good for community tanks.")
                        .padding(.bottom)
                    
                    Image("Corydoras Catfish")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Corydoras Catfish: Peaceful bottom-dwelling fish that help keep the tank clean.")
                        .padding(.bottom)
                    Image("Angelfish")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Angelfish: Elegant and beautiful, but require a larger tank and more specific water parameters.")
                        .padding(.bottom)
                    
                    Image("Discus")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Discus: Known for their circular shape and vibrant colors, but require more advanced care.")
                        .padding(.bottom)
                    Image("Clownfish")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Clownfish: If you have a saltwater setup, clownfish are popular and visually appealing. ")
                        .padding(.bottom)
                    
                    Text("Important Considerations:")
                        .font(.largeTitle)
                        .padding(.bottom)
                    Text("Tank Size:  Research the specific needs of each fish species regarding tank size and water conditions.  Compatibility:  Ensure that the fish you choose are compatible with each other in terms of temperament and space requirements.   Water Conditions:  Maintain proper water temperature, pH, and filtration to keep your fish healthy.   Beginner's Luck:  Some fish are more forgiving of beginner mistakes than others.   Do Your Research:  Before purchasing any fish, research their specific needs to ensure you can provide them with a suitable environment.")
                        .fontDesign(.serif)
                        .padding(.bottom)
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
struct ReptilesAndAmphibians: View {
    var body: some View {
        NavigationView{
            NavigationStack{
               ScrollView{
                   Text("Reptiles:")
                       .font(.title)
                    Image("Leopard Geckos")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Leopard Geckos -  These are known for their docile nature, easy handling, and manageable size. They are also relatively hardy and tolerate mistakes well, making them a good starter reptile ")
                       .padding(.bottom)
                    
                    Image("Bearded Dragons")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Bearded Dragons -  Bearded dragons are another popular choice due to their relatively low-maintenance nature and ease of handling. They are known for their unique appearance and docile temperament, and can be fascinating educational companions.")
                        .padding(.top)
                    Image("Corn Snakes")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text("Corn Snakes-  Corn snakes are a classic beginner snake due to their docile temperament and manageable size. They come in various colors and patterns and are known for their striking appearance.")
                        .padding(.bottom)
                    Image("Crested Geckos")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(" Crested Geckos - These geckos are arboreal, meaning they live in trees, and are known for their sticky toe pads that allow them to climb smooth surfaces. They are relatively easy to care for and can be a great choice for those interested in an active lizard.")
                        .padding(.bottom)
                    Image("Ball Pythons")
                        .resizable()
                        .frame(width:200, height: 200)
                    Text(" Ball Pythons - These snakes are known for their calm demeanor, easy care requirements, and manageable size. They are not challenging to handle and are generally passive creatures.")
                        .padding(.bottom)
                   Text("Amphibians:")
                       .font(.title)
                   
                    Image("Axolotls")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(" Axolotls - These fascinating amphibians are salamanders that retain their larval features throughout their lives, including gills. They are relatively easy to care for and can be fun to observe in their aquatic environment.")
                        .padding(.bottom)
                    
                    Image("Pacman Frogs")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Pacman Frogs - These large, colorful frogs are known for their voracious appetites and can be fascinating to watch. They are relatively low-maintenance and can be a good choice for those who appreciate a unique-looking pet.  ")
                        .padding(.bottom)
                    
                    Image("White's Tree Frogs")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("White's Tree Frogs - Also known as Australian green tree frogs, these are a popular choice for amphibian keepers due to their docile nature and ease of care.")
                        .padding(.bottom)
                   
                   Image("Red-eyed Tree Frogs")
                       .resizable()
                       .frame(width: 200, height: 200)
                   Text("Red-eyed Tree Frogs -  These frogs are known for their striking appearance and can be a beautiful addition to a bioactive terrarium. They are relatively easy to care for and are known for their bright colors.")
                       .padding(.bottom)
                   
                   Image("Oriental Fire-Bellied Toads")
                       .resizable()
                       .frame(width: 200, height: 200)
                   Text("Oriental Fire-Bellied Toads -  These toads are known for their vibrant colors and relatively easy care requirements. They are a good choice for beginners interested in amphibians.")
                       .padding(.bottom)
                  
                   
                   
                    
                    
                    
                    
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
//struct TextView: View {
//    @State private var name: String = ""
//    var body: some View {
//        TextField("Enter your name", text: $name)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//    }
//}


