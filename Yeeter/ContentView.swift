//
//  ContentView.swift
//  Yeeter
//
//  Created by Antonio Vega Jr on 10/23/19.
//  Copyright © 2019 Antonio Vega Jr. All rights reserved.
//
import SwiftUI

struct ContentView : View {

  @EnvironmentObject var session: SessionStore

  func getUser () {
      session.listen()
  }

  var body: some View {
    NavigationView {
        Group {
          if (session.session != nil) {
            Text("Hello user!")
            .navigationBarTitle("Welcome!")
            .navigationBarItems(trailing: Button(action: {
                self.session.signOut()
            }) {
                Text("Logout")
            })
          } else {
            SignInView()
            .navigationBarItems(trailing: Text(""))
          }
        }
        .onAppear(perform: getUser)
       
      }
    }
    
}

#if DEBUG
   struct ContentView_Previews : PreviewProvider {
       static var previews: some View {
           ContentView()
               .environmentObject(SessionStore())
       }
   }
   #endif
