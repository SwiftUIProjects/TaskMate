//
//  TaskMateApp.swift
//  TaskMate
//
//  Created by Swapna Botta on 15/06/26.
//

import SwiftUI

@main
struct TaskMateApp: App {
 
    private var coreDataManager = CoreDataManager.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    let notificationDelegate = NotificationDelegate()
       
       init() {
           UNUserNotificationCenter.current().delegate = notificationDelegate
           NotificationManager.shared.requestPermission()
       }
    
    var body: some Scene {
        WindowGroup {
            TaskList()
                .preferredColorScheme(isDarkMode ? .dark : .light)

                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
        }
    }
}
