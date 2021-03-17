//
//  HeadRequestOperation.swift
//  AsyncTaskQueueTests
//
//  Created by SuXinDe on 2021/3/14.
//  Copyright © 2021 Skyprayer Studio. All rights reserved.
//

import Foundation
import AsyncTaskQueue

/// Contrived example class that makes a HEAD request for a given URL. Its a
/// concrete subclass of AsyncOperation, which makes it easy to chain it
/// together with other (NS)Operations via standard dependencies:
///
///     let head = HeadRequestOperation(url: u) { result in
///         switch (result) {...}
///     }
///     let finish = BlockOperation {...}
///     finish.addDependency(head)
///
class HeadRequestOperation: AsyncOperation {
    
    enum Result {
        case success(HTTPURLResponse)
        case error(HTTPURLResponse?, Error?)
    }
    
    let url: URL
    private var result: Result = .error(nil, nil)
    
    init(url: URL, resultHandler: @escaping (Result) -> Void) {
        self.url = url
        super.init()
        addCompletionHandler { [weak self] in
            let result = self?.result ?? .error(nil, nil)
            resultHandler(result)
        }
    }
    
    override func execute(finish: @escaping () -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            let httpResponse = (response as? HTTPURLResponse)
            if let r = httpResponse, error == nil {
                self?.result = .success(r)
            } else {
                self?.result = .error(httpResponse, error)
            }
            finish()
        }
        task.resume()
    }
    
}

