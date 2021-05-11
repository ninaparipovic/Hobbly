//
//  ContentView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = ActivityStore()
    
    @State var selectedIndex = 0
    @State var addModal = false
    @State var rowNumber : Int = 0
    @State var menuOpen: Bool = false
    
    let tabBarImageNames = ["house.fill", "person.2.fill", "plus.circle", "magnifyingglass", "person.fill"]
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                SideMenu(width: 270,
                         isOpen: self.menuOpen,
                         menuClose: self.openMenu)

                Spacer()
                    .fullScreenCover(isPresented: $addModal, content: {
                        Button(action: {addModal.toggle()}, label: {
                            Text("dismiss modal")
                        })
                    })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        HomeView(store: self.store)
                            .navigationBarItems(leading: self.menuOpen ?
                                                    Button("close") {
                                                        print("closed boi")
                                                    }
                                                    :  Button(action: {
                                                        self.openMenu()
                                                    }, label: {
                                                        Text("Show side menu")
                                                    })
                            )
                    }
                case 1:
                    NavigationView {
                        Text("another tab!")
                            .navigationBarItems(leading:
                                                    Button("Hours") {
                                                        print("Hours tapped!")
                                                    }
                            )
                    }
                default:
                    NavigationView {
                        Text("default tab!")
                    }
                }
            }
            
            Divider()
                .padding(.bottom, 12)
            HStack {
                ForEach(0..<tabBarImageNames.count) { num in
                    Button(action: {
                        if (num == 2) {
                            addModal.toggle()
                            // why do you need to return?
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.orange)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        Spacer()
                    })
                    
                }
            }
        }
        
    }
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: ActivityStore(activityCategories: testData))
    }
}


struct ActivityCell: View {
    let item: Activity
    var body: some View {
        NavigationLink(
            destination: ActivityDetail(activity: item)) {
            Image(item.images[0])
                .resizable()
                .frame(width: 80.0, height: 80.0)
            Text("\(item.name)")

        }
    }
}
