/*
 *
 * <copyright company="Aspose" file="AuthHelper.swift">
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

open class AuthHelper {
    
    static let codeOk = 200
    static let codeUnauthorized = 401

    public class func checkAuth(completion: @escaping ((_ error: AuthError?) -> Void )) {
        
        if (GroupDocsAssemblyCloudAPI.access_token == nil) {
            
            guard let appSid = GroupDocsAssemblyCloudAPI.appSid, let appKey = GroupDocsAssemblyCloudAPI.appKey else {
                completion(AuthError.credentialsNotSetError)
                return
            }
            
            let path = "/oauth2/token"
            let urlString = GroupDocsAssemblyCloudAPI.basePath + path
            
            let parameters: [String: Any] = [
                "grant_type": "client_credentials",
                "client_id": appSid,
                "client_secret": appKey]
            
            let headers: [String: String] = [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            
            Alamofire.request(urlString, method: .post, parameters: parameters, headers: headers).responseJSON {
                
                responseJSON in
                
                guard let statusCode = responseJSON.response?.statusCode, let jsonArray = responseJSON.result.value as? [String: Any] else {
                    completion(AuthError.authError)
                    return
                }
                
                if (statusCode == self.codeOk) {
                    GroupDocsAssemblyCloudAPI.access_token = jsonArray["access_token"] as? String
                    completion(nil)
                    
                }
                else {
                    completion(AuthError.authError)
                }
            }
        }
        else
        {
            completion(nil)
        }
    }
    
    public enum AuthError: Error {
        case credentialsNotSetError
        case authError
    }
}
