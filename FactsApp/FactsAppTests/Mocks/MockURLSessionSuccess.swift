//
//  MockURLSessionSuccess.swift
//  FactsAppTests
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
class MockURLSessionSuccess:URLSession{
    
    let mockResponse: [String: Any] = [
      "title":"About Canada",
      "rows": [
        [
        "title":"Beavers",
        "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
        "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
       ],
        [
        "title":"Hockey Night in Canada",
        "description":"These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.",
        "imageHref":"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
        ]
        ]
    ]
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        var jsonData: Data? = nil
        do {
            jsonData = try JSONSerialization.data(withJSONObject: mockResponse, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        completionHandler(jsonData, URLResponse(), nil)
        return CustomDataTask()
    }
}
