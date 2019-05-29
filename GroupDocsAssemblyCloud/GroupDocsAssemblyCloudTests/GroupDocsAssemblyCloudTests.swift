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

import XCTest
@testable import GroupDocsAssemblyCloud

class GroupDocsAssemblyCloudTests: XCTestCase {
    internal var expectation: XCTestExpectation?
    internal let localTestFolder = "TestData"
    internal let remoteTestFolder = "Temp/SdkTests/swift"
    internal let remoteTestOut = "TestOut"
    internal let localCommonFolder = "TestData/Common"
    internal let testTimeout: TimeInterval = 60.0
    internal let Ok = 200
    
    override func setUp() {
        super.setUp()
        readSettings()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    internal func uploadFile(remoteName: String, localName: String, completion: @escaping ()->Void) {
        let path = "\(self.remoteTestFolder)/\(remoteName)"
        
        let url: URL? = getURL(localName)
        if (nil == url) {
            XCTFail("no file found \(localName)")
            return
        }
        AssemblyAPI.putCreate(path: path, file: url!) {
            (response, error) in
            guard error == nil else {
                XCTFail("error uploading file \(remoteName). \(error?.localizedDescription)")
                return
            }
            if let response = response, response.code == self.Ok {
                completion()
            } else {
                XCTFail("error uploading file \(remoteName)")
            }
            
        }
    }
    
    internal func getURL(_ name: String) -> URL? {
        let bundle = Bundle(for: type(of: self))
        return bundle.url(forResource: name, withExtension: nil)
    }
    
    private func readSettings() {
        if let path = Bundle(for: type(of: self)).path(forResource: "servercreds", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    GroupDocsAssemblyCloudAPI.appSid = jsonResult["AppSid"] as? String
                    GroupDocsAssemblyCloudAPI.appKey = jsonResult["AppKey"] as? String
                    
                    if let basePath = jsonResult["BaseUrl"] as? String
                    {
                        GroupDocsAssemblyCloudAPI.basePath = basePath
                    }
                }
            } catch {
                XCTFail("error reading settings file")
            }
        }
    }
}
