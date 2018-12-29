//
//  LiveDataViewDelegator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/13/18.
//

protocol LiveDataProtocol {
    func didGetPageParams(totalNumberOfItems: Int, itemsPerPage: Int)
    func dataSourceDidChanged(dataSource : [Any])
    func dataSourceDidReset()
}


