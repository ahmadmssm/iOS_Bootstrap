//
//  CountriesTableViewAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CountriesTableViewAdapter: BaseTableViewAdapter<UITableView, CountryEntity> {
        
    convenience init(tableView: UITableView) {
        self.init(tableView: tableView, xibCell: CountriesCell.self)
        self.reloadTable()
        Skeleton.addTo(tableView)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initCell(cell: CountriesCell.self, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dataSource.count > 0) {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
        return 4
    }
    
    override func reloadSinglePageTable(items: [CountryEntity]) {
        Skeleton.removeFrom(getTableView())
        if (dataSource.count == 0) {
            super.reloadSinglePageTable(items: items)
        }
    }
    
    func showAllDataSet(items: [CountryEntity]) {
        resetTable()
        super.reloadSinglePageTable(items: items)
    }
    
    func postSearchItems(searchItems: [CountryEntity]) {
        showAllDataSet(items: searchItems)
    }
}
