//
//  Pagination.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import SwiftUI

struct Pagination: View {
    
    @ObservedObject var vm = PaginationViewModel()
    

    
    var body: some View {
        
        List(0 ..< vm.data.count, id : \.self) { i in
            
            if i == self.vm.data.count - 1 {
                CellView(doc: vm.data[i], isLast: true, vm: vm)

            } else {
                CellView(doc: vm.data[i], isLast: false, vm: vm)
            }
        }
      
    }
}

struct CellView :View {
    
    var doc : Doc
    var isLast : Bool
    @ObservedObject var vm : PaginationViewModel
    
    
    var body: some View {
        
        VStack {
            Text(doc.id)
            
            Text(doc.eissn)
            
            if isLast {
                Text(doc.journal)
                    .foregroundColor(Color.red)
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.vm.updateData()
                        }
                       
                    }
            } else {
                Text(doc.journal)
            }
           
            
        }
        .padding(.top, 10)
       
        
    }
}

struct Pagination_Previews: PreviewProvider {
    static var previews: some View {
        Pagination()
    }
}


