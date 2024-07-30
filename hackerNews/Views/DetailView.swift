

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    
    var body: some View {
         webViwe(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "HTTP/google.com")
    }
}


struct webViwe: UIViewRepresentable{

    let urlString: String?
    
    func makeUIView(context: Context) -> webViwe.UIViewType{
        return WKWebView()
        
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let repuest = URLRequest(url: url)
                uiView.load(repuest)
            }
        }
    }
}
