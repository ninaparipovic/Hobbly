//
//  ActivityStore.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI
import Combine

class ActivityStore : ObservableObject {
    var activityCategories : [ActivitySection] {
        didSet{ didChange.send() }
    }
    
    init(activityCategories : [ActivitySection] = []) {
        self.activityCategories = activityCategories
    }
    
    // gives us local object that we can subscribe to and send updates to
    var didChange = PassthroughSubject<Void, Never>()
    
}

