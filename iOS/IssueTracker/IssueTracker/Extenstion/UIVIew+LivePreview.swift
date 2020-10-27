
#if DEBUG
import UIKit
import SwiftUI

extension UIView {

    var liveView: some View {
        LiveView(view: self)
    }
    
    struct LiveView<V: UIView>: UIViewRepresentable {
        
        let view: V
        
        func makeUIView(context: UIViewRepresentableContext<LiveView<V>>) -> V {
            return view
        }
        
        func updateUIView(_ uiView: V, context: UIViewRepresentableContext<LiveView<V>>) {
            
        }
        
    }
}

#endif

struct UIVIew_LivePreview_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
