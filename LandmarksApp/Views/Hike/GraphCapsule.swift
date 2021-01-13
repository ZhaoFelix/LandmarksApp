/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single line in the graph.
*/

import SwiftUI

struct GraphCapsule: View {
  
    var body: some View {
        Capsule()
            .fill(Color.white)
           
    }
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        // The graph that uses the capsule tints it by multiplying against its
        // base color of white. Emulate that behavior here in the preview.
        GraphCapsule()
            .colorMultiply(.blue)
    }
}
