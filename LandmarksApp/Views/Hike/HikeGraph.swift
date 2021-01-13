/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI

extension Animation {
    static func ripple(index:Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct HikeGraph: View {
    var hike:Hike
    var path:KeyPath<Hike.Observarion,Range<Double>>
    var color:Color {
        switch path {
        case \.elevation :
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    var body: some View {
        let data = hike.observations
        
        Text("")
    }

}
struct HikeGraph_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]

    static var previews: some View {
        HikeGraph(hike: hike, path: \.elevation)
    }
}
