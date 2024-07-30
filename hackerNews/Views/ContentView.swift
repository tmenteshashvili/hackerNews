

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManeger = NetworkManeger()
    
    
    var body: some View {
        NavigationView{
            List(networkManeger.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
               
                
            }
            .navigationBarTitle("Hacker News")
        }
        
        
        .task {
            do{
                try await self.networkManeger.fetchData()
            } catch {
                print("Erorr",error)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
