//
//  Network logger data formatter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//

public extension GenericRestClient {
    func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}
