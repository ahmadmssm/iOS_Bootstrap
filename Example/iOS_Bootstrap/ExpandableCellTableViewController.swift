////
////  ExpandableCellTableViewController.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 11/17/18.
////  Copyright © 2018 CocoaPods. All rights reserved.
////
//
//import iOS_Bootstrap
//
//protocol ExpandableCellTableViewDelegator : BaseViewDelegator {
//    
//}
//
//class ExpandableCellTablePresenter : BasePresenter<ExpandableCellTableViewDelegator> {
//    
//    required init(viewDelegator: ExpandableCellTableViewDelegator) {
//        super.init(viewDelegator: viewDelegator)
//    }
//    
//}
//
//class ExpandableCellTableViewController:
//            MyMenuItemTableViewController
//                    <ExpandableCellTablePresenter, ExpandableCellTableViewDelegator, Section>,
//            ExpandableCellTableViewDelegator,
//            BaseTableViewDelegates {
//
//    @IBOutlet weak var tableView: UITableView!
//    private var sections : [Section]!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sections = [Section]()
//        sections = [
//            Section(name: "Mac", items: ["MacBook", "MacBook Air", "MacBook Pro", "iMac", "Mac Pro", "Mac mini", "Accessories", "OS X El Capitan"]),
//            Section(name: "iPad", items: ["iPad Pro", "iPad Air 2", "iPad mini 4", "Accessories"]),
//            Section(name: "iPhone", items: ["iPhone 6s", "iPhone 6", "iPhone SE", "Accessories"])
//        ]
//    }
//
//    override func initTableViewAdapterConfiguraton() {
//        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: ExpandableTableViewCell.self, delegate: self)
//
//    }
//    
//    func configureNumberOfSections(tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func configureNumberOfRowsForSection(tableView: UITableView, section: Int) -> Int {
//        if section == 0 { return 1 }
//        
//        // For section 1, the total count is items count plus the number of headers
//        var count = sections.count
//        
//        for section in sections {
//            count += section.items.count
//        }
//        
//        return count
//    }
//    
//    func configureHeightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 { return tableView.rowHeight }
//        
//        // Calculate the real section index and row index
//        let section = getSectionIndex(indexPath.row)
//        let row = getRowIndex(indexPath.row)
//        
//        // Header has fixed height
//        if row == 0 { return 50.0 }
//        
//        return sections[section].collapsed! ? 0 : 44.0
//    }
//    
//    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell : ExpandableTableViewCell = tableView.dequeueReusableCell(forIndexPath: CIFaceFeature)
//            cell.textLabel?.text = "Apple"
//            return cell
//        }
//        
//        // Calculate the real section index and row index
//        let section = getSectionIndex(indexPath.row)
//        let row = getRowIndex(indexPath.row)
//        
//        if row == 0 {
//            let cell : ExpandableTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
//            cell.textLabel?.text = sections[section].name
//            cell.cellToggler.tag = section
//            cell.cellToggler.setTitle(sections[section].collapsed! ? "+" : "-", for: .normal)
//            cell.cellToggler.addTarget(self, action: #selector(ExpandableCellTableViewController.toggleCollapse), for: .touchUpInside)
//            return cell
//        }
//        else {
//            let cell : UITableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
//            cell.textLabel?.text = sections[section].items[row - 1]
//            return cell
//        }
//    }
//    
//    func getSectionIndex(_ row: NSInteger) -> Int {
//        let indices = getHeaderIndices()
//        
//        for i in 0..<indices.count {
//            if i == indices.count - 1 || row < indices[i + 1] {
//                return i
//            }
//        }
//        
//        return -1
//    }
//    
//    func getRowIndex(_ row: NSInteger) -> Int {
//        var index = row
//        let indices = getHeaderIndices()
//        
//        for i in 0..<indices.count {
//            if i == indices.count - 1 || row < indices[i + 1] {
//                index -= indices[i]
//                break
//            }
//        }
//        
//        return index
//    }
//    
//    func getHeaderIndices() -> [Int] {
//        var index = 0
//        var indices: [Int] = []
//        
//        for section in sections {
//            indices.append(index)
//            index += section.items.count + 1
//        }
//        
//        return indices
//    }
//    
//    @objc func toggleCollapse(_ sender: UIButton) {
//        let section = sender.tag
//        let collapsed = sections[section].collapsed
//        
//        // Toggle collapse
//        sections[section].collapsed = !collapsed!
//        
//        let indices = getHeaderIndices()
//        
//        let start = indices[section]
//        let end = start + sections[section].items.count
//        
//        tableView.beginUpdates()
//        for i in start ..< end + 1 {
//            tableView.reloadRows(at: [IndexPath(row: i, section: 1)], with: .automatic)
//        }
//        tableView.endUpdates()
//    }
//    
//}
//
