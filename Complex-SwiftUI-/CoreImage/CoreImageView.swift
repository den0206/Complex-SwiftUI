//
//  CoreImageView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/13.
//

import SwiftUI
import PhotosUI

struct CoreImageView: View {
    
    @StateObject var vm = CoreImageViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if !vm.filterImages.isEmpty && vm.mainImage != nil {
                    /// exist
                    
                    Spacer(minLength: 0)
                    
                    Image(uiImage: vm.mainImage.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                    
                    Slider(value: $vm.filterValue)
                        .padding()
                        .opacity(vm.mainImage.isEditablle ? 1 : 0)
                        .disabled(vm.mainImage.isEditablle ? false : true)
                    
                    /// filterImages
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing : 20) {
                            ForEach(vm.filterImages) { filterd in
                                Image(uiImage: filterd.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                    .onTapGesture(perform: {
                                        vm.filterValue = 1.0
                                        vm.mainImage = filterd
                                    })
                            }
                        }
                        .padding()
                    })
                } else if vm.filterImages.count == 0 {
                    Text("Pick up Image")
                } else {
                    ProgressView()
                }
            }
            .onChange(of: vm.imageData, perform: { value in
                vm.filterImages.removeAll()
                vm.mainImage = nil
                /// load filters
                vm.loadFilter()
                
            })
            .onChange(of: vm.filterValue, perform: { value in
                vm.updateEffect()
            })
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.vm.imagePicker.toggle()}, label: {
                        Image(systemName: "photo")
                            .font(.title2)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        /// save photo album
                        UIImageWriteToSavedPhotosAlbum(vm.mainImage.image, nil, nil, nil)
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                    })
                    .disabled(vm.mainImage == nil ? true : false)
                }
            })
            .sheet(isPresented: $vm.imagePicker, content: {
                PHPicker(picker: $vm.imagePicker, imageData: $vm.imageData)
            })
            
            .navigationTitle("Use CoreImage")
            .preferredColorScheme(.dark)
    
        }
    }
}

struct PHPicker : UIViewControllerRepresentable {
    
    @Binding var picker : Bool
    @Binding var  imageData : Data
    
    func makeCoordinator() -> PHPickerCoordinator {
        return PHPicker.PHPickerCoordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) ->  PHPickerViewController {
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    class PHPickerCoordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent : PHPicker
        
        init(parent : PHPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            
            if !results.isEmpty{
                
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) { (image, err) in
                        
                        DispatchQueue.main.async {
                            
                            
                            self.parent.imageData = (image as! UIImage).pngData()!
                            self.parent.picker.toggle()
                        }
                    }
                }
            }
            else{
                
                self.parent.picker.toggle()
            }
        }
    }
    
}


