//
//  NotificationsController.swift
//  Memento Mori
//
//  Created by Kamil Rudnicki on 02/05/2020.
//  Copyright © 2020 TimeCamp S.A. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

func scheduleNotification2(hour: Int) {
    let center = UNUserNotificationCenter.current()

    let content = UNMutableNotificationContent()
    content.title = "Memento Mori"
    content.body = String(format: "Przypomnij sobie, że za ok. %@ tygodni umżesz.", weeks())
    content.categoryIdentifier = "alarm"
    content.userInfo = ["customData": "fizzbuzz"]
    content.sound = UNNotificationSound.default

    var dateComponents = DateComponents()
    dateComponents.hour = hour
    dateComponents.minute = 30
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

    let request = UNNotificationRequest(identifier: String(format: "memento%02d", hour), content: content, trigger: trigger)
    center.add(request)
}

func scheduleNotifications() {
//    UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//        print("Requests: \(notificationRequest)")
//    }
    
    
    //scheduleNotification2(hour: 20)
    //scheduleNotification2(hour: 10)
    scheduleNotification2(hour: 20)
}

func scheduleNotification() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
        switch settings.authorizationStatus {
        case .notDetermined:
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted == true && error == nil {
                    scheduleNotifications()
                }
            }
        case .authorized, .provisional:
            scheduleNotifications()
            
        default:
            break // Do nothing
        }
    }
}
