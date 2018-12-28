//
//  BaseTableViewCellV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/26/18.
//

open class BaseTableViewCellV2 <M>: BaseTableViewCell {
    
    var cellModel: M? { didSet { initCellFrom(cellModel: cellModel!) } }
    
    open func initCellFrom(cellModel: M) { fatalError("Must Override") }
    
}