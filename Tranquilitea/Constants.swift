//
//  Constants.swift
//  Tranquilitea
//
//  Created by mac on 10/3/23.
//

import Foundation
import SwiftUI

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

let affrimationTitles = ["Self-love", "Reassurance", "Strength", "It’s okay"]

let affirmations = [
    "Self-love" :
        ["You can be a work in progress and still love yourself.",
        """
        Things To Affirm In The Mirror:
        I never lack.
        I am going to get myself where I want to be.
        I am confident in my self-expression.
        I trust my intuition.
        I am a powerful creator.
        I forgive myself.
        I am creating a life that I love.
        I accept and love my body.
        I am talented.
        I respond to turbulence with calmness.
        I am financially abundant.
        I am focused and disciplined.
        I am surrounded by grace and love.
        I am easy to love.
        I am aligned with my purpose.
        I trust the timing of my life.
        I am worthy of the life I dream of.
        """, """
        My peace is non-negotiable.
        I have overcome a lot, and refuse to compromise my inner tranquility again.
        """],
    "Reassurance" :
        ["Life is beautiful, and I have time. I am focused on progress, not perfection. I am at peace with all that I cannot control. I am at peace with myself. I am a master at practicing acceptance. I lean into faith and lean out of fear. I am empowered. I am healing.",
         "I am free. I approve of myself. I am divinely guided, protected and empowered. Courage flows through me. Today and always, I walk my path with grace and gratitude, knowing that the future I dream of is waiting for me. I am exactly where I need to be."],
    "Strength" :
        ["""
        All you can do is all you can do.
        Focus on what you can control, release what you can't.
        """,
        "My path is clear. My mind is focused. Everything is aligning in my favor. I am deserving of all of the good things that are happening in my life. I deserve to be loved well. I am inherently worthy. I have nothing to prove to anyone but myself. Everyday is an amazing day to be me.", 
        """
        Things You Have:
        The ability to try again.
        The option to forgive yourself.
        Dreams yet to be realized.
        An intuition that will steer you right.
        The opportunity to make things right.
        The capacity to give and receive love.
        A beautiful future to look forward to.
        Wisdom to inform healthy discernment.
        People who love you.
        Passions that ignite a fire within you.
        The resilience of your spirit.
        Talent that deserves to be nurtured.
        The chance to learn from mistakes.
        Life.
        """],
    "It’s okay" :
        ["Even if it doesn’t feel like it right now, everything is going to be okay. You are okay. You will be okay. This is not the end. It will not be like this forever",
        """
        Breathe.
        You haven't met all of you yet.
        There is so much more life to live
        """]
]

let quotes = [
    "\"Don’t limit your challenges. Challenge your limits\"",
    "\"Sometimes the most productive thing you can do is relax.\" - Mark Black",
    "\"Smile. Breathe. And go slowly.\""
]

let viewsName = ["Affirmations", "Prompts", "Journal", "Guided Meditation", "Independent Meditation", "Box Breathing", "Focus Breathing"]

struct viewsList {
    let name: String
    let destination: AnyView
}

//let test = viewsList(name: "Affirmations", destination: AffirmationSelection())
//let test2 = viewsList(name: "Prompts", destination: PromptSelection())



let viewList = [
    viewsList(name: "Affirmations", destination:AnyView(AffirmationSelection())),
    viewsList(name: "Prompts", destination: AnyView(PromptSelection())),
    viewsList(name: "Journal", destination: AnyView(JournalSelection())),
    viewsList(name: "Guided Meditation", destination: AnyView(GuidedMeditation())),
    viewsList(name: "Independent Meditation", destination: AnyView(IndependentMeditation())),
    viewsList(name: "Box Breathing", destination: AnyView(SquareBreathing())),
    viewsList(name: "Focus Breathing", destination: AnyView(FocusBreathing()))
]







