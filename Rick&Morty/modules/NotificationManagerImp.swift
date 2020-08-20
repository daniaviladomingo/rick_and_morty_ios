//
//  NotificationManagerImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 19/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class NotificationManagerImp: NSObject, INotificationManager {
    
    private let notificationCenter: UNUserNotificationCenter
    
    init(notificationCenter: UNUserNotificationCenter) {
        self.notificationCenter = notificationCenter
    }
    
    func notify(title: String, msg: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = msg
        content.sound = .default
        
        // 2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: title, content: content, trigger: trigger)
        
        // 3
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}


