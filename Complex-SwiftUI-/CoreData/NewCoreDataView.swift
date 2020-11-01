//
//  NewCoreDataView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/15.
//

import SwiftUI

struct NewCoreDataView: View {
    
    @ObservedObject var vm : CoreDateViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New")
                    .font(.system(size: 65))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }.padding()
            
            TextEditor(text: $vm.content)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing : 10) {
                DateButton(title: "Today", vm: vm)
                
                DateButton(title: "Tomorrow", vm: vm)
                
                DatePicker("", selection: $vm.date, displayedComponents: .date)
                    .labelsHidden()
                
                
            }
            .padding()
            
            Button(action: {vm.addDate(context: context)}) {
                
                Label {
                    Text("Add Now")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                } icon: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(
                    LinearGradient(gradient: .init(colors: [Color.white, Color.pink]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)

            }
            .padding()
            .disabled(vm.content == "" ? true : false)
            .opacity(vm.content == "" ? 0.5 : 1)
            
        }
        .background(Color.black.opacity(0.06)).ignoresSafeArea(.all, edges: .bottom)
    }
}

struct DateButton : View {
    
    var title : String
    @ObservedObject var vm : CoreDateViewModel
    
    var body: some View {
        
        Button(action: {vm.changeDate(value: title)}) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(vm.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    vm.checkDate() == title ? LinearGradient(gradient: .init(colors: [Color.white, Color.pink]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
                    
                )
                .cornerRadius(6)
        }
    }
    
}
