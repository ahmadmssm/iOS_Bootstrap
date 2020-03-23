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
        tableView.addShimmer()
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
        getTableView().removeShimmer()
        if (dataSource.count == 0) {
            super.reloadSinglePageTable(items: items)
        }
    }
    
    func postItems(items: [CountryEntity]) {
        resetTable()
        reloadSinglePageTable(items: items)
    }
}
