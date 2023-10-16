//
//  PastPrompts.swift
//  Tranquilitea
//
//  Created by mac on 9/15/23.
//

import SwiftUI
import CoreData

struct PastPrompts: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            ZStack {
                Color("Green White").ignoresSafeArea(edges: .top)
                VStack {
                    Text("Past Prompts")
                        .font(.custom("Inter-Regular", size: 20))
                    Color("Light Green")
                        .frame(width: 175, height: 2)
                    
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                PromptTyping(item: item)
                            } label: {
                                Text(item.prompt!)
                                    .font(.custom("Inter-Regular", size: 17))
                            }
                            .listRowBackground(Color("Green White"))
                            
                        }
                        .onDelete(perform: deleteItems)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color("Dark Green"))
                            .frame(width: 350)
                            .padding())
                    }
                    .background(Color("Green White"))
                    .scrollContentBackground(.hidden)
                    //.listStyle(InsetListStyle())
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    
                    Spacer()
                    Divider()
                }
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

/*private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct PastPrompts_Previews: PreviewProvider {
    static var previews: some View {
        PastPrompts().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}*/
