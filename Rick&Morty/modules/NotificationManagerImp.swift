//
//  NotificationManagerImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 19/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class NotificationManagerImp: NSObject, INotificationManager, UNUserNotificationCenterDelegate {
    
    private let notificationCenter: UNUserNotificationCenter
    private let window: UIWindow
    
    init(notificationCenter: UNUserNotificationCenter, window: UIWindow) {
        self.notificationCenter = notificationCenter
        self.window = window
    }
    
    func notify(title: String, msg: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = msg
        content.sound = .default
        content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
        
        // 2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: title, content: content, trigger: trigger)
        
        // 3
        notificationCenter.add(request)
    }
}

extension NotificationManagerImp {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//    }
}


