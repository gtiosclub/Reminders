//
//  Reminder.swift
//  Reminders
//
//  Created by Cal Stephens on 2/11/18.
//  Copyright © 2018 GT iOS Club. All rights reserved.
//

struct Reminder {
    
    let text: String
    var completed: Bool
    
    mutating func toggleCompleted() {
        completed = !completed
    }
    
}
