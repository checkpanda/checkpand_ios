//
// Created by Takagi Yuki on 2018/03/26.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class ToDoListViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        self.navigationItem.title = "アカウント名" // TODO アカウントを入れる

        self.navigationController?.navigationBar.isTranslucent = false

        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .gray
        settings.style.buttonBarItemTitleColor = .black
        containerView.isScrollEnabled = false


        super.viewDidLoad()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        var childViewControllers: [UIViewController] = []
        let list = ["すべて", "今日", "今週"]

        list.forEach {
            let sb = storyboard.instantiateViewController(withIdentifier: "toDoListTabView") as! ToDoListTabViewController
            sb.setIndicatorInfo(info: $0)
            // TODO TODOのフィルタリング
            sb.toDoList = [ToDo(t:"todo1 \($0)"), ToDo(t:"todo2 \($0)"), ToDo(t:"todo3 \($0)")]
            childViewControllers.append(sb)
        }
        return childViewControllers
    }
}
