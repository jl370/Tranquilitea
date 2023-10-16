//
//  PromptTyping.swift
//  Tranquilitea
//
//  Created by mac on 9/18/23.
//

import SwiftUI
import CoreData

struct PromptTyping: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var address = ""
    @State var item : Item
    
    var body: some View {
        VStack {
            Text(item.prompt ?? "Prompt")
                .padding(.top, 40.0)
                .font(.custom("Inter-Regular", size: 17.0))
                .multilineTextAlignment(.center)
            Color("Light Green")
                .frame(width: 300, height: 2)
            ScrollView {
                ZStack {
                    VStack {
                        TextEditor(text: $item.entry.toUnwrapped(defaultValue: ""))
                            .lineLimit(1...)
                            .padding()
                            .lineSpacing(21)
                            .font(.custom("Inter-Regular", size: 17.0))
                        Spacer()
                    }
                    VStack {
                        Color("Light Green")
                            .frame(height: 2)
                            .padding(.top, 49)
                        ForEach(1...30, id: \.self) {_ in
                            Color("Light Green")
                                .frame(height: 2)
                                .padding(.top, 32)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

/*func lineCount(_ str: String) -> Int {
    var count = 0
    for acsiiValue in str.utf8 {
        if acsiiValue == 10 {
            count += 1
        }
    }
    return count
}*/

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

/*struct PromptTyping_Previews: PreviewProvider {
    static var previews: some View {
        PromptTyping(item: <#Item#>).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}*/
