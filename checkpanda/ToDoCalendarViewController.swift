//
// Created by Takagi Yuki on 2018/03/27.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class ToDoCalendarViewController: UIViewController,
                                  FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance,
                                  UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var currentMonth: UIBarButtonItem!
    func setCurrentMonthTitle(_ date: Date) {
        currentMonth.title = monthDateFormatter.string(from: date)
    }

    
    var toDoList: [ToDo] = [ToDo(t: "test1")]

    let cellIdentifier = "toDoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellIdentifier)

        initCalendar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initCalendar() {
        calendar.appearance.headerMinimumDissolvedAlpha = 1
        setCurrentMonthTitle(calendar.currentPage)
    }

    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    fileprivate lazy var monthDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM"
        return formatter
    }()

    func judgeHoliday(_ date: Date) -> Bool {
        let tmpCalendar = Calendar(identifier: .gregorian)

        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        let holiday = CalculateCalendarLogic()

        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }

    func getDay(_ date: Date) -> (year: Int, month: Int, day: Int) {
        let tmpCalendar = Calendar(identifier: .gregorian)

        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        return (year, month, day)
    }

    func getWeekIdx(_ date: Date) -> Int {
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if self.judgeHoliday(date) {
            return UIColor.red
        }

        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        } else if weekday == 7 {
            return UIColor.blue
        }

        return nil
    }

    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(getDay(date))
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        setCurrentMonthTitle(calendar.currentPage)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ToDoTableViewCell
        cell.setCell(todo: toDoList[indexPath.row])
        return cell
    }
}
