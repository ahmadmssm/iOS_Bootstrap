//
//  BaseTableViewCellV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/26/18.
//

open class BaseTableViewCellV2 <M>: BaseTableViewCell {
    
    public var mCellModel: M? { didSet { initCellFrom(cellModel: mCellModel!) } }
    
    public var cellModel: M? {
        set { mCellModel = newValue }
        get { return mCellModel }
    }
    
    open func initCellFrom(cellModel: M) { fatalError("Must Override") }
    
}
