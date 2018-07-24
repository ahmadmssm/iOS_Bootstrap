//
//  BaseController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

open class BaseController <V : UIViewController> {
    
    public final var view: V!
    
    required public init (view : V) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
   // required public init <V : UIViewController> (view : V) { self.view = view }

}

