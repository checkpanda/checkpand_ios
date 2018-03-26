//
// Created by Takagi Yuki on 2018/03/13.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ToDoListTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemInfo: IndicatorInfo = ""
    
    var toDoList: [ToDo] = []
    
    let cellIdentifier = "toDoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
        cell.title.text = toDoList[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func setIndicatorInfo(info: String) {
        itemInfo = IndicatorInfo(title: info)
    }
    
}
