/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="TemplateFileInfo.swift">
 *   Copyright (c) 2020 GroupDocs.Assembly for Cloud
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

// TemplateFileInfo dto.             
public class TemplateFileInfo : Codable, AssemblyAPIModel {
    
    // Field of filePath. Gets or sets path to file.                   
    private var filePath : String?;
    
    // Field of storageName. Gets or sets the name of storage.                   
    private var storageName : String?;
    
    // Field of versionId. Gets or sets the name of storage.                   
    private var versionId : String?;
    
    // Field of password. Gets or sets the password.                   
    private var password : String?;
        
    private enum CodingKeys: String, CodingKey {
        case filePath;
        case storageName;
        case versionId;
        case password;
        case invalidCodingKey;
    }
        
    public init() {
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.filePath = try container.decodeIfPresent(String.self, forKey: .filePath);
        self.storageName = try container.decodeIfPresent(String.self, forKey: .storageName);
        self.versionId = try container.decodeIfPresent(String.self, forKey: .versionId);
        self.password = try container.decodeIfPresent(String.self, forKey: .password);
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.filePath != nil) {
            try container.encode(self.filePath, forKey: .filePath);
        }
        if (self.storageName != nil) {
            try container.encode(self.storageName, forKey: .storageName);
        }
        if (self.versionId != nil) {
            try container.encode(self.versionId, forKey: .versionId);
        }
        if (self.password != nil) {
            try container.encode(self.password, forKey: .password);
        }
    }
    
    // Sets filePath. Gets or sets path to file.               
    public func setFilePath(filePath : String?) {
        self.filePath = filePath;
    }
    
    // Gets filePath. Gets or sets path to file.               
    public func getFilePath() -> String? {
        return self.filePath;
    }
    
    // Sets storageName. Gets or sets the name of storage.               
    public func setStorageName(storageName : String?) {
        self.storageName = storageName;
    }
    
    // Gets storageName. Gets or sets the name of storage.               
    public func getStorageName() -> String? {
        return self.storageName;
    }
    
    // Sets versionId. Gets or sets the name of storage.               
    public func setVersionId(versionId : String?) {
        self.versionId = versionId;
    }
    
    // Gets versionId. Gets or sets the name of storage.               
    public func getVersionId() -> String? {
        return self.versionId;
    }
    
    // Sets password. Gets or sets the password.               
    public func setPassword(password : String?) {
        self.password = password;
    }
    
    // Gets password. Gets or sets the password.               
    public func getPassword() -> String? {
        return self.password;
    }
}
