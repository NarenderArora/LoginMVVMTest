//
//  HttpUtility.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import Foundation

struct HttpUtility
{
    func getApiData(requestUrl: URL, completionHandler:@escaping(_ result: AllUsers?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(AllUsers.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }

        }.resume()
    }
}
