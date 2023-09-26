//
//  MindfullnessView.swift
//  Tranquilitea
//
//  Created by mac on 9/6/23.
//

import SwiftUI
import CoreData

struct MindfullnessView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var prompts = "temp"
    @State var isActive = false
    @State var newItem : Item?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("not Hello, World!")
                NavigationLink(destination: PastPrompts()) {
                    Text("oui")
                }
            
                Button {
                    newItem = addItem(prompt1: prompts)
                    isActive = true
                } label: {
                    Text("Navigate Button")
                }
                
                    
                           
                           /*NavigationLink(destination: PromptTyping(item: newItem), isActive: $isActive){
                               Button {
                                   newItem = addItem(prompt1: prompts)
                                   isActive = false
                               } label: {
                                   Text("testing")
                               }
                           }*/
                           
                Spacer()
                Divider()
            }
            .navigationDestination(isPresented: $isActive) {
                if isActive {
                    PromptTyping(item: newItem!)
                } else {
                    MindfullnessView()
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
    
/*struct MindfullnessView_Previews: PreviewProvider {
    static var previews: some View {
        MindfullnessView()
    }
}*/
