//
//  CoreDataViewModel.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/15.
//

import SwiftUI
import CoreData

class CoreDateViewModel : ObservableObject {
    
    /// Task property
    @Published var content = ""
    @Published var date = Date()
    
    @Published var updateItem : Task!
    @Published var sheetNewData = false
    
    let calender = Calendar.current
    
    func checkDate() -> String {
        
        if calender.isDateInToday(date) {
            return "Today"
        } else if calender.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other day"
        }
    }
    
    func changeDate(value : String) {
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        } else {
            
        }
    }
    
    /// new & edit
    
    func addDate(context : NSManagedObjectContext) {
       let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        
        print(newTask)
        do {
            try context.save()
            sheetNewData = false
            content = ""
            date = Date()
        } catch {
            print(error.localizedDescription)
        }
    }
}

