//
//  MemorizeView.swift
//  Memorize
//
//  Created by Tim Li on 28/10/2023.
//

import SwiftUI

struct MemorizeView: View {
    private var viewModal: MemorizeViewModel = MemorizeViewModel()
    @State var theme: String = "Sport"
    
    var body: some View {
        VStack {
            title
            Spacer()
            cards
            Spacer()
            controller
        }
        .padding()
    }
    
    var title: some View {
        IconView(icon: "brain.head.profile", label: "Memorize", isVertical: false)
        .font(.largeTitle)
        .foregroundColor(.indigo)
        .padding()
    }
    
    var cards: some View {
        return ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(viewModal.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModal.choose(card: card)
                        }
                }
            }
        }
    }
    
    var controller: some View {
        HStack {
            controllerTab(icon: "figure.run", label: "Sport")
            Spacer()
            controllerTab(icon: "car", label: "Transport")
            Spacer()
            controllerTab(icon: "sun.max", label: "Weather")
        }
        .font(.title2)
        .foregroundColor(.indigo)
        .padding()
    }
    
    func controllerTab(icon: String, label: String) -> some View {
        IconView(icon: icon, label: label)
            .onTapGesture {
                theme = label
            }
    }
}
    
struct CardView: View {
    var card: MemorizeModel.Card
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            box.stroke(.orange, lineWidth: 2)
            IconView(icon: card.content).font(.largeTitle)
            if (!card.isFaceUp) {
                box.fill(.orange)
            }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
    }
}

struct IconView: View {
    
    let icon: String
    var label: String?
    var isVertical = true
    
    var body: some View {
        Group {
            if (isVertical) {
                VStack {
                    bodyContent
                }
            } else {
                HStack {
                    bodyContent
                }
            }
        }
    }
    
    var bodyContent: some View {
        Group {
            Image(systemName: icon)
            
            if (label != nil) {
                Text(label!)
            }
        }
    }
}
    
#Preview {
    MemorizeView()
}
