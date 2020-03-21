//
//  BaseGenericCollectionViewHeaderOrFooter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/8/19.
//

open class BaseGenericCollectionViewHeaderOrFooter<M>: BaseCollectionViewHeaderOrFooter {
    
    public var cellModel: M? { didSet { initCellFrom(cellModel: cellModel!) } }
    
    open func initCellFrom(cellModel: M) { fatalError("Must Override") }
    
}
