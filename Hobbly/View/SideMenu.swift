//
//  SideMenu.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        // Code here
        MenuContent()
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)

                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List {
            VStack {
                Image(systemName: "person")
                    .font(.system(size: 40, weight: .bold))
                Text("Hi, Sally!")
            }
            
            Text("MY PROFILE")
            Text("MY FRIENDS")
            Text("MY INTERESTS")
            Text("SAVED")
            Text("ACTIVITY LOG")
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
