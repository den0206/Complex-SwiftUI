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
    
    @Binding var url : String
    @Binding var present : Bool
    
    func makeCoordinator() -> Coordinator {
        return GIFController.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) ->  GiphyViewController {
        Giphy.configure(apiKey: KGYPHKEY)
        let controller = GiphyViewController()
        controller.mediaTypeConfig = [.emoji,.gifs, .stickers]
        controller.delegate = context.coordinator
        
        /// Fix ug Height for Full screen
        GiphyViewController.trayHeightMultiplier = 1.05
        controller.theme = GPHTheme(type: .light)
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject, GiphyDelegate {
        
        var parent : GIFController
        
        init(parent : GIFController) {
            self.parent = parent
        }
        
        func didDismiss(controller: GiphyViewController?) {
            
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            let url = media.url(rendition: .fixedWidth, fileType: .gif)
            parent.url = url ?? ""
            parent.present.toggle()
        }
    }
  
}


