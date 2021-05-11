//
//  HomeView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var store: ActivityStore
    var body: some View {
        List {
            ForEach(store.activityCategories) { activityType in
                Section(header:  Text("Category: \(activityType.name)")) {
                    ForEach(activityType.activities) { item in
                        ActivityCell(item: item)
                    }
                }
            }
        }
        .navigationTitle("I have __ minutes")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(store: ActivityStore(activityCategories: testData))
        }
    }
}
