//
//  JournalSelection.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct JournalSelection: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var isActive = false
    @State var newItem : Item?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Green White").ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    
                    
                    Text("Journal")
                        .foregroundStyle(.white)
                        //.padding(.top, 40)
                        .font(.custom("Inter-Regular", size: 35))
                        .background(RoundedRectangle(cornerRadius: 30)
                            //.padding(.top, 40)
                            .frame(width: 310, height: 80)
                            .foregroundColor(Color("Light Green")))
            
                    
                    Button {
                        newItem = addItem(prompt1: "Journal")
                        isActive = true
                    } label: {
                        Text("Start new Journal")
                            .foregroundStyle(.black)
                            .padding(.top, 100)
                            .font(.custom("Inter-Regular", size: 28))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .padding(.top, 100)
                                .frame(width: 310, height: 180)
                                .foregroundColor(Color("Dark Green")))
                    }
                    
                    NavigationLink(destination: PastPrompts()) {
                        Text("Past Journals")
                            .foregroundStyle(.black)
                            .padding(.top, 100)
                            .font(.custom("Inter-Regular", size: 28))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .padding(.horizontal)
                                .frame(width: 310, height: 180)
                                .foregroundColor(Color("Dark Green")))
                    }
                    
                    /*Text("Continue writing:")
                        .padding(.top, 60)
                        .font(.custom("Inter-Regular", size: 28))*/
                    
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
    JournalSelection()
}
