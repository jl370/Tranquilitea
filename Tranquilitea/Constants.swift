//
//  Constants.swift
//  Tranquilitea
//
//  Created by mac on 10/3/23.
//

import Foundation

//the whole reason this is here is because i accidentally produced a bunch of errors from unknowingly resuing variable names
struct Prompt: Identifiable, Hashable {
    var id: String {promptName}
    
    let promptName: String
}

let prompts = [
    Prompt(promptName: "What makes you feel calm?"),
    Prompt(promptName: "What makes you feel in control?"),
    Prompt(promptName: "What makes you feel powerful?"),
    Prompt(promptName: "How do you encourage yourself when you're trying something new?"),
    Prompt(promptName: "How do you stay focused and steer clear of distractions?"),
    Prompt(promptName: "How do you savor the time you get alone?"),
    Prompt(promptName: "How do you swap envy for joy when other people accomplish things?"),
    Prompt(promptName: "How do you set boundaries and avoid absorbing someone else's emotions and stress?"),
    Prompt(promptName: "How do you trust yourself to make big decisions?"),
    Prompt(promptName: "How do you forgive yourself when you make a mistake?")
]









