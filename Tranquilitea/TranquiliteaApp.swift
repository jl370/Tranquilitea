//
//  TranquiliteaApp.swift
//  Tranquilitea
//
//  Created by mac on 9/4/23.
//

import SwiftUI

@main
struct TranquiliteaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
