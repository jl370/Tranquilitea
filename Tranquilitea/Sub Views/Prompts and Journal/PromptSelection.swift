//
//  PromptSelection.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct PromptSelection: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var isActive = false
    @State var newItem : Item?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Green White").ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    
                    Button {
                        newItem = addItem(prompt1: prompts.randomElement()!.promptName)
                        isActive = true
                    } label: {
                        Text("Generate")
                            .foregroundStyle(.black)
                            .padding(.top)
                            .font(.custom("Inter-Regular", size: 25))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .padding([.top, .leading, .trailing])
                                .frame(width: 350, height: 70)
                                .foregroundColor(Color("Dark Green")))
                    }
                    
                    Text("OR")
                        .font(.custom("Inter-Regular", size: 20.0))
                        .padding(.top, 40.0)
                    Text("Choose your own:")
                        .padding(.top)
                        .font(.custom("Inter-Regular", size: 20.0))
                    
                    ScrollView() {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(prompts, id: \.self) { item in
                                Button {
                                    newItem = addItem(prompt1: item.promptName)
                                    isActive = true
                                } label: {
                                    Text("\(item.promptName)")
                                        .foregroundStyle(.black)
                                        .frame(width: 300)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .font(.custom("Inter-Regular", size: 20))
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 5.0)
                                            .foregroundColor(Color("Dark Green")))
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height: 400)
                    
                    Spacer()
                    
                    NavigationLink(destination: PastPrompts()) {
                        Text("Past Prompts")
                            .foregroundStyle(.black)
                            .padding(.vertical)
                            .font(.custom("Inter-Regular", size: 25))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .padding(.horizontal)
                                .frame(width: 350, height: 70)
                                .foregroundColor(Color("Dark Green")))
                    }
                    
                    Spacer()
                    Divider()
                }
                .navigationDestination(isPresented: $isActive) {
                    if isActive {
                        PromptTyping(item: newItem!)
                    } else {
                        PromptSelection()
                    }
                }
            }
        }
    }
    
    private func addItem(prompt1: String) -> Item {
        let newItem = Item(context: viewContext)
        newItem.prompt = prompt1
        newItem.entry = ""
        newItem.timestamp = Date()
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return newItem
    }
}

#Preview {
    PromptSelection()
}
