/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AssemblyAPI.swift">
 *   Copyright (c) 2021 GroupDocs.Assembly for Cloud
 * </copyright>
 * <summary>
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
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
 * --------------------------------------------------------------------------------
 */

import Foundation

// GroupDocs.Assembly Cloud API for Swift
public class AssemblyAPI {
    private let configuration : Configuration;
    private let apiInvoker : ApiInvoker;
    
    // Initializes a new instance of the AssemblyAPI class based on Configuration object.
    public init(configuration : Configuration) {
        self.configuration = configuration;
        self.apiInvoker = ApiInvoker(configuration: configuration);
    }
    
    // Initializes a new instance of the AssemblyAPI class based on AppSid and AppKey.
    public init(appSid: String, appKey: String) {
        self.configuration = Configuration(appSid: appSid, appKey: appKey);
        self.apiInvoker = ApiInvoker(configuration: configuration);
    }
    
    // Async representation of assembleDocument method
    // Builds a document using document template and XML or JSON data passed in request.       
    public func assembleDocument(request : AssembleDocumentRequest, callback : @escaping (_ response : Data?, _ error : Error?) -> ()) {
        do {
            let rawPath = "/assembly/assemble";
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            
            
            
            apiInvoker.invoke(
                url: urlPath,
                method: "POST",
                body: try ObjectSerializer.serializeBody(value: request.getAssembleOptions()),
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(response, error);
                }
            );
        }
        catch let error {
            callback(nil, error);
        }
    }   
    
    // Sync representation of assembleDocument method
    // Builds a document using document template and XML or JSON data passed in request.     
    public func assembleDocument(request : AssembleDocumentRequest) throws -> Data {
        let semaphore = DispatchSemaphore(value: 0);
        var responseObject : Data? = nil;
        var responseError : Error? = nil;
        self.assembleDocument(request : request, callback: { response, error in
            responseObject = response;
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        return responseObject!;
    }
    
    // Async representation of copyFile method
    // Copy file       
    public func copyFile(request : CopyFileRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/file/copy/{srcPath}";
            rawPath = rawPath.replacingOccurrences(of: "{srcPath}", with: try ObjectSerializer.serializeToString(value: request.getSrcPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            queryItems.append(URLQueryItem(name: "destPath", value: try ObjectSerializer.serializeToString(value: request.getDestPath())));
            if (request.getSrcStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "srcStorageName", value: try ObjectSerializer.serializeToString(value: request.getSrcStorageName()!)));
            }
            if (request.getDestStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "destStorageName", value: try ObjectSerializer.serializeToString(value: request.getDestStorageName()!)));
            }
            if (request.getVersionId() != nil) {
                queryItems.append(URLQueryItem(name: "versionId", value: try ObjectSerializer.serializeToString(value: request.getVersionId()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of copyFile method
    // Copy file     
    public func copyFile(request : CopyFileRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.copyFile(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of copyFolder method
    // Copy folder       
    public func copyFolder(request : CopyFolderRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/folder/copy/{srcPath}";
            rawPath = rawPath.replacingOccurrences(of: "{srcPath}", with: try ObjectSerializer.serializeToString(value: request.getSrcPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            queryItems.append(URLQueryItem(name: "destPath", value: try ObjectSerializer.serializeToString(value: request.getDestPath())));
            if (request.getSrcStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "srcStorageName", value: try ObjectSerializer.serializeToString(value: request.getSrcStorageName()!)));
            }
            if (request.getDestStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "destStorageName", value: try ObjectSerializer.serializeToString(value: request.getDestStorageName()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of copyFolder method
    // Copy folder     
    public func copyFolder(request : CopyFolderRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.copyFolder(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of createFolder method
    // Create the folder       
    public func createFolder(request : CreateFolderRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/folder/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of createFolder method
    // Create the folder     
    public func createFolder(request : CreateFolderRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.createFolder(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of deleteFile method
    // Delete file       
    public func deleteFile(request : DeleteFileRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/file/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (request.getVersionId() != nil) {
                queryItems.append(URLQueryItem(name: "versionId", value: try ObjectSerializer.serializeToString(value: request.getVersionId()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "DELETE",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of deleteFile method
    // Delete file     
    public func deleteFile(request : DeleteFileRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.deleteFile(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of deleteFolder method
    // Delete folder       
    public func deleteFolder(request : DeleteFolderRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/folder/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (request.getRecursive() != nil) {
                queryItems.append(URLQueryItem(name: "recursive", value: try ObjectSerializer.serializeToString(value: request.getRecursive()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "DELETE",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of deleteFolder method
    // Delete folder     
    public func deleteFolder(request : DeleteFolderRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.deleteFolder(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of downloadFile method
    // Download file       
    public func downloadFile(request : DownloadFileRequest, callback : @escaping (_ response : Data?, _ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/file/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (request.getVersionId() != nil) {
                queryItems.append(URLQueryItem(name: "versionId", value: try ObjectSerializer.serializeToString(value: request.getVersionId()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "GET",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(response, error);
                }
            );
        }
        catch let error {
            callback(nil, error);
        }
    }   
    
    // Sync representation of downloadFile method
    // Download file     
    public func downloadFile(request : DownloadFileRequest) throws -> Data {
        let semaphore = DispatchSemaphore(value: 0);
        var responseObject : Data? = nil;
        var responseError : Error? = nil;
        self.downloadFile(request : request, callback: { response, error in
            responseObject = response;
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        return responseObject!;
    }
    
    // Async representation of getFilesList method
    // Get all files and folders within a folder       
    public func getFilesList(request : GetFilesListRequest, callback : @escaping (_ response : FilesList?, _ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/folder/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "GET",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    var responseObject : FilesList? = nil;
                    var responseError = error;
                    if (responseError == nil) {
                        do {
                            responseObject = try ObjectSerializer.deserialize(type: FilesList.self, from: response!);
                        }
                        catch let deserializeError {
                            responseError = deserializeError;
                        }
                    }
                    callback(responseObject, responseError);
                }
            );
        }
        catch let error {
            callback(nil, error);
        }
    }   
    
    // Sync representation of getFilesList method
    // Get all files and folders within a folder     
    public func getFilesList(request : GetFilesListRequest) throws -> FilesList {
        let semaphore = DispatchSemaphore(value: 0);
        var responseObject : FilesList? = nil;
        var responseError : Error? = nil;
        self.getFilesList(request : request, callback: { response, error in
            responseObject = response;
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        return responseObject!;
    }
    
    // Async representation of getSupportedFileFormats method
    // Retrieves list of supported file formats.       
    public func getSupportedFileFormats(request : GetSupportedFileFormatsRequest, callback : @escaping (_ response : FileFormatsResponse?, _ error : Error?) -> ()) {
        do {
            let rawPath = "/assembly/formats";
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            
            
            
            apiInvoker.invoke(
                url: urlPath,
                method: "GET",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    var responseObject : FileFormatsResponse? = nil;
                    var responseError = error;
                    if (responseError == nil) {
                        do {
                            responseObject = try ObjectSerializer.deserialize(type: FileFormatsResponse.self, from: response!);
                        }
                        catch let deserializeError {
                            responseError = deserializeError;
                        }
                    }
                    callback(responseObject, responseError);
                }
            );
        }
        catch let error {
            callback(nil, error);
        }
    }   
    
    // Sync representation of getSupportedFileFormats method
    // Retrieves list of supported file formats.     
    public func getSupportedFileFormats(request : GetSupportedFileFormatsRequest) throws -> FileFormatsResponse {
        let semaphore = DispatchSemaphore(value: 0);
        var responseObject : FileFormatsResponse? = nil;
        var responseError : Error? = nil;
        self.getSupportedFileFormats(request : request, callback: { response, error in
            responseObject = response;
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        return responseObject!;
    }
    
    // Async representation of moveFile method
    // Move file       
    public func moveFile(request : MoveFileRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/file/move/{srcPath}";
            rawPath = rawPath.replacingOccurrences(of: "{srcPath}", with: try ObjectSerializer.serializeToString(value: request.getSrcPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            queryItems.append(URLQueryItem(name: "destPath", value: try ObjectSerializer.serializeToString(value: request.getDestPath())));
            if (request.getSrcStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "srcStorageName", value: try ObjectSerializer.serializeToString(value: request.getSrcStorageName()!)));
            }
            if (request.getDestStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "destStorageName", value: try ObjectSerializer.serializeToString(value: request.getDestStorageName()!)));
            }
            if (request.getVersionId() != nil) {
                queryItems.append(URLQueryItem(name: "versionId", value: try ObjectSerializer.serializeToString(value: request.getVersionId()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of moveFile method
    // Move file     
    public func moveFile(request : MoveFileRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.moveFile(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of moveFolder method
    // Move folder       
    public func moveFolder(request : MoveFolderRequest, callback : @escaping (_ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/folder/move/{srcPath}";
            rawPath = rawPath.replacingOccurrences(of: "{srcPath}", with: try ObjectSerializer.serializeToString(value: request.getSrcPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            queryItems.append(URLQueryItem(name: "destPath", value: try ObjectSerializer.serializeToString(value: request.getDestPath())));
            if (request.getSrcStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "srcStorageName", value: try ObjectSerializer.serializeToString(value: request.getSrcStorageName()!)));
            }
            if (request.getDestStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "destStorageName", value: try ObjectSerializer.serializeToString(value: request.getDestStorageName()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: nil,
                callback: { response, error in
                    callback(error);
                }
            );
        }
        catch let error {
            callback(error);
        }
    }   
    
    // Sync representation of moveFolder method
    // Move folder     
    public func moveFolder(request : MoveFolderRequest) throws  {
        let semaphore = DispatchSemaphore(value: 0);
        
        var responseError : Error? = nil;
        self.moveFolder(request : request, callback: { error in
            
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        
    }
    
    // Async representation of uploadFile method
    // Upload file       
    public func uploadFile(request : UploadFileRequest, callback : @escaping (_ response : FilesUploadResult?, _ error : Error?) -> ()) {
        do {
            var rawPath = "/assembly/storage/file/{path}";
            rawPath = rawPath.replacingOccurrences(of: "{path}", with: try ObjectSerializer.serializeToString(value: request.getPath()));
            let urlPath = (try self.configuration.getApiRootUrl()).appendingPathComponent(rawPath);
            
            var urlBuilder = URLComponents(url: urlPath, resolvingAgainstBaseURL: false)!;
            var queryItems : [URLQueryItem] = [];
            if (request.getStorageName() != nil) {
                queryItems.append(URLQueryItem(name: "storageName", value: try ObjectSerializer.serializeToString(value: request.getStorageName()!)));
            }
            if (queryItems.count > 0) {
                urlBuilder.queryItems = queryItems;
            }
            
            
            var formParams : [RequestFormParam] = [];
            formParams.append(RequestFormParam(name: "fileContent", body: try ObjectSerializer.serializeFile(value: request.getFileContent())));
            
            apiInvoker.invoke(
                url: urlBuilder.url!,
                method: "PUT",
                body: nil,
                headers: nil,
                formParams: formParams,
                callback: { response, error in
                    var responseObject : FilesUploadResult? = nil;
                    var responseError = error;
                    if (responseError == nil) {
                        do {
                            responseObject = try ObjectSerializer.deserialize(type: FilesUploadResult.self, from: response!);
                        }
                        catch let deserializeError {
                            responseError = deserializeError;
                        }
                    }
                    callback(responseObject, responseError);
                }
            );
        }
        catch let error {
            callback(nil, error);
        }
    }   
    
    // Sync representation of uploadFile method
    // Upload file     
    public func uploadFile(request : UploadFileRequest) throws -> FilesUploadResult {
        let semaphore = DispatchSemaphore(value: 0);
        var responseObject : FilesUploadResult? = nil;
        var responseError : Error? = nil;
        self.uploadFile(request : request, callback: { response, error in
            responseObject = response;
            responseError = error;
            semaphore.signal();
        });
                
        _ = semaphore.wait();
        
        if (responseError != nil) {
            throw responseError!;
        }
        return responseObject!;
    }
}

