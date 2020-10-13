//
//  CoreImageViewModel.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/13.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

final class CoreImageViewModel : ObservableObject {
    
    @Published var imagePicker = false
    @Published var imageData = Data(count: 0)
    
    @Published var filterImages : [FilterImage] = []
    @Published var mainImage : FilterImage!
    
    @Published var filterValue : CGFloat = 1.0
    
    let filters : [CIFilter] = [
        CIFilter.sepiaTone(), CIFilter.comicEffect(), CIFilter.colorInvert(),CIFilter.photoEffectFade(), CIFilter.colorMonochrome(), CIFilter.photoEffectChrome(), CIFilter.gaussianBlur(), CIFilter.bloom()]
    
    func loadFilter() {
        let context = CIContext()
        
        filters.forEach { (filter) in
            DispatchQueue.global(qos: .background).async {
                let ciImage = CIImage(data: self.imageData)
                filter.setValue(ciImage!, forKey: kCIInputImageKey)
                guard let newImage = filter.outputImage else {return}
                
                let cgImage = context.createCGImage(newImage, from: newImage.extent)
                let isEditable = filter.inputKeys.count > 1
                let filterdData = FilterImage(image: UIImage(cgImage: cgImage!), filter: filter, isEditablle: isEditable)
                
                DispatchQueue.main.async {
                    self.filterImages.append(filterdData)
                    
                    if self.mainImage == nil {self.mainImage = self.filterImages.first}
                }
            }
        }
    }
    
    func updateEffect() {
        let context = CIContext()
        
        DispatchQueue.global(qos: .userInteractive).async {
            let ciImage = CIImage(data: self.imageData)
            let filter = self.mainImage.filter
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
            if filter.inputKeys.contains("inputRadius"){
                
                filter.setValue(self.filterValue * 10, forKey: kCIInputRadiusKey)
            }
            if filter.inputKeys.contains("inputIntensity"){
                
                filter.setValue(self.filterValue, forKey: kCIInputIntensityKey)
            }
            
            guard let newImage = filter.outputImage else{return}
            
            
            let cgimage = context.createCGImage(newImage, from: newImage.extent)
            
            DispatchQueue.main.async {
                                
                self.mainImage.image = UIImage(cgImage: cgimage!)
            }
            
        }
    }
    
}

struct FilterImage : Identifiable {
    var id = UUID().uuidString
    var image : UIImage
    var filter : CIFilter
    var isEditablle : Bool
}
