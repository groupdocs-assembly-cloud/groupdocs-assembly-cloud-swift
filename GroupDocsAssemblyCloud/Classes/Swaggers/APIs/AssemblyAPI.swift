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
import Alamofire



open class AssemblyAPI {
    /**
     Builds a document using document template and XML or JSON data passed in request
     
     - parameter name: (path) File name of template, which is located on a storage 
     - parameter data: (form) Report data in JSON or XML format 
     - parameter saveOptions: (body) Save options in json format 
     - parameter folder: (query) Folder path where template file is located(on a storage) (optional)
     - parameter destFileName: (query) Result name of built document (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postAssembleDocument(request: PostAssembleDocumentRequest, completion: @escaping ((_ data: URL?,_ error: Error?) -> Void)) {
        AuthHelper.checkAuth() {
            (error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            postAssembleDocumentWithRequestBuilder(request: request).execute { (response, error) -> Void in
                completion(response?.body, error)
            }
        }
    }

    /**
     Builds a document using document template and XML or JSON data passed in request
     - POST /assembly/{name}/build
     - examples: [{output=none}]
     
     - parameter name: (path) File name of template, which is located on a storage 
     - parameter data: (form) Report data in JSON or XML format 
     - parameter saveOptions: (body) Save options in json format 
     - parameter folder: (query) Folder path where template file is located(on a storage) (optional)
     - parameter destFileName: (query) Result name of built document (optional)

     - returns: RequestBuilder<URL> 
     */
    private class func postAssembleDocumentWithRequestBuilder(request: PostAssembleDocumentRequest) -> RequestBuilder<URL> {
        var path = "/\(GroupDocsAssemblyCloudAPI.apiVersion)/assembly/{name}/build"
        let namePreEscape = "\(request.Name)"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = GroupDocsAssemblyCloudAPI.basePath + path
        var parameters: [String: Any?] = [:]
        parameters["saveOptions"] = String(data: CodableHelper.encode(request.SaveOptions).data!, encoding: .utf8)
            parameters["data"] = request.Data

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "Folder": request.Folder, 
            "DestFileName": request.DestFileName
        ])

        let requestBuilder: RequestBuilder<URL>.Type = GroupDocsAssemblyCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }


 /**
     Upload a specific file 
     
     - parameter path: (query) Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext 
     - parameter file: (form) File to upload 
     - parameter versionId: (query) Source file&#39;s version (optional)
     - parameter storage: (query) User&#39;s storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putCreate(path: String, file: URL, versionId: String? = nil, storage: String? = nil, completion: @escaping ((_ data: GroupDocsResponse?,_ error: Error?) -> Void)) {
        AuthHelper.checkAuth() {
            (authError) in
            guard authError == nil else {
                completion(nil, authError)
                return
            }
            putCreateWithRequestBuilder(path: path, file: file, versionId: versionId, storage: storage).execute { (response, error) -> Void in
                completion(response?.body, error);
            }
        }
    }


    /**
     Upload a specific file 
     - PUT /storage/file
     - examples: [{contentType=application/json, example={
  "Status" : "Status",
  "Code" : 0
}}]
     
     - parameter path: (query) Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext 
     - parameter file: (form) File to upload 
     - parameter versionId: (query) Source file&#39;s version (optional)
     - parameter storage: (query) User&#39;s storage name (optional)
     - returns: RequestBuilder<GroupDocsResponse> 
     */
    open class func putCreateWithRequestBuilder(path: String, file: URL, versionId: String? = nil, storage: String? = nil) -> RequestBuilder<GroupDocsResponse> {
        let pathUrl = "/v1/storage/file"
        let URLString = GroupDocsAssemblyCloudAPI.basePath + pathUrl
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let urlObj = NSURLComponents(string: URLString)
        urlObj?.queryItems = APIHelper.mapValuesToQueryItems([
            "path": path, 
            "versionId": versionId, 
            "storage": storage
        ])
        

        let requestBuilder: RequestBuilder<GroupDocsResponse>.Type = GroupDocsAssemblyCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (urlObj?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
/*
 *
 * <copyright company="Aspose" file="PostAssembleDocumentRequest.swift">
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

/*
 * Request model for postAssembleDocument operation.
 */
open class PostAssembleDocumentRequest {

    /*
     * File name of template, which is located on a storage
     */
    public var Name: String
    
    /*
     * Report data in JSON or XML format
     */
    public var Data: URL
    
    /*
     * Save options in json format
     */
    public var SaveOptions: LoadSaveOptionsData
    
    /*
     * Folder path where template file is located(on a storage)
     */
    public var Folder: String
    
    /*
     * Result name of built document
     */
    public var DestFileName: String
    

    public init(name: String, data: URL, saveOptions: LoadSaveOptionsData, folder: String, destFileName: String) {
        self.Name = name;
        self.Data = data;
        self.SaveOptions = saveOptions;
        self.Folder = folder;
        self.DestFileName = destFileName;
    }
}
