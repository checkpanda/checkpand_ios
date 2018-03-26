//
// Created by Takagi Yuki on 2018/03/13.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class ToDoCategoryListViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        self.navigationItem.title = "カテゴリー"
        
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


        let f = storyboard.instantiateViewController(withIdentifier: "toDoListTabView") as! ToDoListTabViewController
        var toDoList: [ToDo] = [ToDo(t: "title1"), ToDo(t: "title2")]
        f.setIndicatorInfo(info: "タブ1")
        f.toDoList = toDoList
        toDoList = [ToDo(t: "title3"), ToDo(t: "title4")]
        let s = storyboard.instantiateViewController(withIdentifier: "toDoListTabView") as! ToDoListTabViewController
        s.setIndicatorInfo(info: "タブ2")
        s.toDoList = toDoList
        let childViewControllers: [UIViewController] = [f, s]
        return childViewControllers
    }
}
