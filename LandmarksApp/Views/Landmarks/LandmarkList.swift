//
//  LandmarkList.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData:ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark:Landmark?
    
    enum FilterCategory:String,CaseIterable,Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id:FilterCategory {self}
    }
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter{
            landmark in
            (!showFavoritesOnly || landmark.isFavorite) &&
                (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title:String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorites \(title)" : title
    }
    
    var index:Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    var body: some View {
        NavigationView {
            List(selection:$selectedLandmark) {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favoritest only")
                })
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark),
                        label: {
                            LandmarkRow(landmark: landmark)
                        })
                        .tag(landmark)
                }
                
            }
            .navigationTitle(title)
            .frame(minWidth:300)
            .toolbar {
                ToolbarItem{
                    Menu {
                        Picker("Category",selection:$filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        Toggle(isOn: $showFavoritesOnly, label: {
                            Label("Favorites only",systemImage:"star.fill")
                        })
                    } label: {
                        Label("Filter",systemImage:"slider.horizontal.3")
                    }

                }
            }
            Text("Select a landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE","iPhone XS Max"],id:\.self) { deviceName  in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
