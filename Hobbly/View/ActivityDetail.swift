//
//  ActivityDetail.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/9/21.
//

import SwiftUI

struct ActivityDetail: View {
    let activity : Activity
    var body: some View {
        Image(activity.images[0])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationBarTitle(Text(activity.name), displayMode: .inline)
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActivityDetail(activity: testData[0].activities[0])
        }
    }
}
