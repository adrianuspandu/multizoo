//
//  animalNames.swift
//  Edutainment
//
//  Created by student on 12.04.25.
//

let animalNames = [
    "bear",
    "buffalo",
    "chick",
    "chicken",
    "cow",
    "crocodile",
    "dog",
    "duck",
    "elephant",
    "frog",
    "giraffe",
    "goat",
    "gorilla",
    "hippo",
    "horse",
    "monkey",
    "moose",
    "narwhal",
    "owl",
    "panda",
    "parrot",
    "penguin",
    "pig",
    "rabbit",
    "rhino",
    "sloth",
    "snake",
    "walrus",
    "whale",
    "zebra"
]

func randomAnimal() -> String {
    return animalNames.randomElement() ?? ""
}
