import SwiftUI

struct ListScreen: View {
    var body: some View {
        NavigationView {
            List {
                Section("SwiftUI") {
                    NavigationLink("Snow") {
                        SnowView()
                    }
                    NavigationLink("Heart Explosion") {
                        HeartExplosionView()
                    }
                    NavigationLink("Rise") {
                        RiseView()
                    }
                }
                Section("UIKit") {
                    NavigationLink("Snow") {
                        SnowUIView()
                            .edgesIgnoringSafeArea(.all)
                    }
                    NavigationLink("Heart Explosion") {
                        HeartExplosionUIView()
                    }
                    NavigationLink("Rise") {
                        RiseUIView()
                    }
                }
            }
            .navigationTitle("Particle Effect Example")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
