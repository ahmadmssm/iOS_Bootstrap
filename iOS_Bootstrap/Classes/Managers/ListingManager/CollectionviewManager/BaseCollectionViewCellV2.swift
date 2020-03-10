//
//  BaseCollectionViewCellV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/27/18.
//

open class BaseCollectionViewCellV2 <M>: BaseCollectionViewCell {
    
    public var cellModel: M? { didSet { initCellFrom(cellModel: cellModel!) } }
    
    open func initCellFrom(cellModel: M) { fatalError("Must Override") }

}
