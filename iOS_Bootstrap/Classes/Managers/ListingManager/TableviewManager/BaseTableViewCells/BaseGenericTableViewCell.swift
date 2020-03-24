//
//  BaseGenericTableViewCell.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/26/18.
//

open class BaseGenericTableViewCell<M>: BaseTableViewCell {
    
    public var cellModel: M! { didSet { initCellFrom(cellModel: cellModel) } }

    open func initCellFrom(cellModel: M) { fatalError("Must Override") }
}
