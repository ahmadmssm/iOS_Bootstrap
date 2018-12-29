//
//  BaseLiveListingPresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/13/18.
//

open class BaseLiveListingPresenter<T, M>: BasePresenter <T>
                                      where M: Codable {
    
    private var binder: LiveDataProtocol!
    private var isListLoadingForTheFirstTime : Bool = true

    private var liveDataSource : [M] {
        didSet { binder.dataSourceDidChanged(dataSource: liveDataSource) }
    }
    
    public final func setPaginationParams(totalNumberOfItems: Int, itemsPerPage: Int) {
        if (self.isListLoadingForTheFirstTime) {
            self.isListLoadingForTheFirstTime = false
            binder.didGetPageParams(totalNumberOfItems: totalNumberOfItems, itemsPerPage: itemsPerPage)
        }
    }

    public var dataSource : [M] {
        set { liveDataSource = newValue }
        get { return liveDataSource }
    }
    
    required public init(viewDelegator: T) {
        liveDataSource = []
        super.init(viewDelegator: viewDelegator)
    }
    
    final func bindListingView(_ binder: LiveDataProtocol) { self.binder = binder }
    
    open func reloadFromScratch() {
        liveDataSource.removeAll()
        dataSource.removeAll()
        binder.dataSourceDidReset()
    }
    
    public final func resetPagination() { isListLoadingForTheFirstTime = true }
    
}
