//
//  Activity.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/4/21.
//

import SwiftUI

struct ActivitySection: Identifiable {
    var id = UUID()
    var name: String
    var activities: [Activity]

    var imageName: String {return name}
    var thumbnailName: String { return name + "Thumb"}
}

struct Activity: Identifiable {
    var id = UUID()
    var name: String
    // make price a new data type that can hold exact prices as well as $/$$/$$$
    var price: Int
    // is Date a valid data type
//    var duration: Date
    var description: String
    var images: [String]
    
    var imageName: String {return name}
    var thumbnailName: String { return name + "Thumb"}
}

#if DEBUG
let testData = [
    ActivitySection(name: "Food", activities: [
        Activity(name: "KAF Baking", price: 50, description: "yummy sourdough", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "cookies", price: 0, description: "fun", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Lous", price: 20, description: "quality local food", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Mont Vert", price: 15, description: "in Woodstock", images: ["kaf1", "kaf2", "kaf3"])
                ]),
    ActivitySection(name: "Outdoors", activities: [
                    Activity(name: "Gile", price: 0, description: "easy", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Cardigan", price: 0, description: "medium", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Moosilauke", price: 0, description: "hard", images: ["kaf1", "kaf2", "kaf3"])
                ]),
    ActivitySection(name: "Fitness", activities: [
                    Activity(name: "Yoga Class", price: 20, description: "relaxing", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Stadium Sprints", price: 0, description: "Memorial Field", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Tennis", price: 0, description: "topliff courts", images: ["kaf1", "kaf2", "kaf3"]),
                    Activity(name: "Spin class", price: 15, description: "RVC", images: ["kaf1", "kaf2", "kaf3"])
                ])
]
#endif
