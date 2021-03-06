//
//  CoreDataView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/15.
//

import SwiftUI


struct CoreDataView: View {
    
    @StateObject var vm = CoreDateViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Task>
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            /// Z1
            VStack(spacing : 0) {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
               
                
                if results.isEmpty {
                    Spacer()
                    
                    Text("No Task")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            ForEach(results) { task in
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text(task.content ?? "")
                                        
                                }
                                
                            }
                        }
                    }
                }
               
                
            }
            
            /// Z2
            Button(action: {vm.sheetNewData = true}) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color.white, Color.pink]), center: .center)
                    )
                    .clipShape(Circle())
            }
            .padding()
            .sheet(isPresented: $vm.sheetNewData) {
                NewCoreDataView(vm: vm)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        
       
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
