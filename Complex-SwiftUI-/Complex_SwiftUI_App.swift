//
//  Complex_SwiftUI_App.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/03.
//

import SwiftUI

@main
struct Complex_SwiftUI_App: App {
    
    let viewType : RootView = .ShoesShop
    
    var body: some Scene {
        WindowGroup {
            viewType.rootView
        }
    }

    
}



enum RootView  {
    
    case CustomCarusel
    case Search
    case SideMenu
    case CirculaSlider
    case ProgressHUd
    case JsonParse
    case FeelingMeter
    case pagination
    case OwnAPI
    case Dating
    case DailyCharts
    case StoryCard
    case LazyVgridSearch
    case Travel
    case ShoesShop
    case CircularTab
    
        
    var rootView : AnyView{
        switch  self {
        
        case .CustomCarusel:
            return AnyView(Carousel())
        case .Search :
            return AnyView(SearchView())
        case  .SideMenu :
            return AnyView(SideMenuView())
        case .CirculaSlider:
            return AnyView(Circular_Slider())
        case .ProgressHUd:
            return AnyView(Progress_HUD())
        case .JsonParse:
            return AnyView(JSONParse())
        case .FeelingMeter:
            return AnyView(Feeling_Meter())
        case .pagination:
            return AnyView(Pagination())
        case .OwnAPI:
            return AnyView(OwnAPIView())
        case .Dating:
            return AnyView(DatingView())
        case .DailyCharts:
            return AnyView(DailyChartsView())
        case .StoryCard:
            return AnyView(StoryCardView())
        case .LazyVgridSearch:
            return AnyView(LazyVgridSearchView())
        case .Travel:
            return AnyView(TravelView())
        case .CircularTab:
            return AnyView(CircularTabView())
        case .ShoesShop:
            return AnyView(ShoesShopView())
        }
    }
    
}
