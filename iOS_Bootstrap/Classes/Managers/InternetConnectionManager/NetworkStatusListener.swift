//
//  NetworkStatusListener.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//
// Protocol for listenig network status change

public protocol NetworkStatusListener : class {
    func networkStatusDidChanged(status: InternetConnectionManager.Connection)
}

//public extension NetworkStatusListener {
//    func networkStatusDidChanged(status: InternetConnectionManager.Connection) {
//        snackbar?.dismiss()
//        if (status == InternetConnectionManager.Connection.notConnected) {
//            snackbar?.actionText = "Dismiss"
//            snackbar?.actionBlock = { snackbar in
//                snackbar.dismiss()
//            }
//            self.snackbar?.message = "Network became unreachable"
//            self.snackbar?.duration = .forever
//            DispatchQueue.main.async {
//                self.snackbar?.show()
//            }
//        }
//    }
//}

