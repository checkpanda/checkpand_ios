//
// Created by Takagi Yuki on 2018/03/27.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class ToDoCalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {

    @IBOutlet weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let header = calendar.calendarHeaderView.collectionViewLayout.
//        print(header)
//        calendar.calendarHeaderView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
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

    func getDay(_ date: Date) -> (Int, Int, Int) {
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
        }else if weekday == 7 {
            return UIColor.blue
        }

        return nil
    }
    


    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(getDay(date))
    }

    func calendar(_ calendar: FSCalendar, prepareHeaderView: UIView, date: Date) {

        print("hoge")
    }

}
