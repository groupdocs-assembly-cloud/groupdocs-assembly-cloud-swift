/*
 *
 * <copyright company="Aspose">
 *  Copyright (c) 2018 Aspose.Words for Cloud
 * </copyright>
 * <summary>
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * 
 */

import Foundation

public struct APIHelper {
    public static func rejectNil(_ source: [String:Any?]) -> [String:Any]? {
        let destination = source.reduce(into: [String: Any]()) { (result, item) in
            if let value = item.value {
                result[item.key] = value
            }
        }

        if destination.isEmpty {
            return nil
        }
        return destination
    }

    public static func rejectNilHeaders(_ source: [String:Any?]) -> [String:String] {
        return source.reduce(into: [String: String]()) { (result, item) in
            if let collection = item.value as? Array<Any?> {
                result[item.key] = collection.filter({ $0 != nil }).map{ "\($0!)" }.joined(separator: ",")
            } else if let value: Any = item.value {
                result[item.key] = "\(value)"
            }
        }
    }

    public static func convertBoolToString(_ source: [String: Any]?) -> [String:Any]? {
        guard let source = source else {
            return nil
        }

        return source.reduce(into: [String: Any](), { (result, item) in
            switch item.value {
            case let x as Bool:
                result[item.key] = x.description
            default:
                result[item.key] = item.value
            }
        })
    }


    public static func mapValuesToQueryItems(_ source: [String:Any?]) -> [URLQueryItem]? {
        let destination = source.filter({ $0.value != nil}).reduce(into: [URLQueryItem]()) { (result, item) in
            if let collection = item.value as? Array<Any?> {
                let value = collection.filter({ $0 != nil }).map({"\($0!)"}).joined(separator: ",")
                result.append(URLQueryItem(name: item.key, value: value))
            } else if let value = item.value {
                result.append(URLQueryItem(name: item.key, value: "\(value)"))
            }
        }

        if destination.isEmpty {
            return nil
        }
        return destination
    }
}

