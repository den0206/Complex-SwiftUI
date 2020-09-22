//
//  GIFController.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/22.
//

import SwiftUI
import GiphyUISDK
import GiphyCoreSDK

struct GIFController : UIViewControllerRepresentable {
    
    
    func makeUIViewController(context: Context) ->  GiphyViewController {
        let controller = GiphyViewController()
        controller.mediaTypeConfig = [.emoji,.gifs, .stickers]
        
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {
        <#code#>
    }
    
  
}
