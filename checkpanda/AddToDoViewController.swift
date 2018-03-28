//
//  AddToDoViewController.swift
//  checkpanda
//
//  Created by Takagi Yuki on 2018/03/09.
//  Copyright © 2018年 checkpanda. All rights reserved.
//

import UIKit
import Eureka

class AddToDoViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initForm() {
        form +++ Section("")
                <<< TextRow() { row in
                    row.title = "タイトル"
                }
            +++ Section("")
                <<< DateTimeRow() { row in
                    row.title = "期限"
                    row.minimumDate = Date()
                }
                <<< CheckRow() { row in
                    row.title = "繰り返し"
                }
                <<< PickerInlineRow<String>() { row in
                    row.title = "カテゴリー"
                    row.options = ["カテゴリー1", "カテゴリー2"] // TODO fix カテゴリー
                }
                <<< PickerInlineRow<String>() { row in
                    row.title = "優先度"
                    row.options = ["☆☆★", "☆★★", "★★★"] // TODO fix カテゴリー
                }
    }
}
