//
//  ToDo.swift
//  checkpanda
//
//  Created by Takagi Yuki on 2018/03/20.
//  Copyright © 2018年 checkpanda. All rights reserved.
//

import Foundation

class ToDo: NSObject {
    //    ToDo ID
//    var id: UUID // TODO uuid?
    //    ToDoの登録されているグループのID
//    var group_id: Int // UUID? enum?
    //    期限(NULLABLE)
//    var deadline: Date?
    //    通知設定(具体的な種類は?)
//    var notification_setting: Int // TODO enum NotificationSetting
    //    優先度ID
//    var priority: Int // TODO enum Priorityにする?
    //    繰り返し設定(具体的な種類は?)
//    var repeat_setting: Int // TODO enum RepeatSetting
    //    ToDoの「種類」(通常のToDoであるか、テンプレートであるか)
//    var isTemplate: Bool // true = Template, false = 通常のToDo
    //    メモ
//    var memo: String?
    //    ToDoの状態ID
//    var status: ToDoStatus
   
    
    var title: String
//    var category: String?

    init(t: String) {
//        id = UUID()
//        group_id = 0
//        deadline = Date()
//        notification_setting = 0
//        priority = 0
//        repeat_setting = 0
//        isTemplate = false
//        status = .Incomplete
        title = t
    }

}

enum ToDoStatus {
    case Incomplete
    case Done
    case Delete
}
