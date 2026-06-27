//
//  LocalNotifications.swift
//  TaskMate
//
//  Created by Swapna Botta on 16/06/26.
//

import UserNotifications

final class NotificationManager {
    
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permission granted")
            } else {
                print("Permission denied")
            }
        }
    }


    func scheduleNotification(title: String, body: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body  = body
        content.sound = .default

        // Future date trigger
        let components = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: date
        )
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        // Unique ID for each notification
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for \(date)")
            }
        }
    }
    
}








class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {

    // ✅ This method fires when notification arrives while app is ACTIVE/FOREGROUND
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // Show banner + sound even when app is open
        completionHandler([.banner, .sound, .badge])
    }

    // Handles tap on notification
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        print("Notification tapped: \(response.notification.request.identifier)")
        completionHandler()
    }
}
