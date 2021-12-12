//
//  ViewController.swift
//  CalendarPractice-iOS
//
//  Created by 김수연 on 2021/12/13.
//

import UIKit

import Then
import SnapKit

import FSCalendar

class ViewController: UIViewController {

    var calendarView = FSCalendar().then {
        $0.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        $0.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        $0.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
    }


}

extension ViewController {
    func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    func setViewHierarchies() {
        view.backgroundColor = .white
        view.addSubview(calendarView)
    }

    func setConstraints() {
        calendarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
        }
    }
}
