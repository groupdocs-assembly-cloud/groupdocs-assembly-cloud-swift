/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="StorageFile.swift">
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

// File or folder information
public class StorageFile : Codable, AssemblyAPIModel {
    
    // Field of name. File or folder name.      
    private var name : String?;
    
    // Field of isFolder. True if it is a folder.      
    private var isFolder : Bool?;
    
    // Field of modifiedDate. File or folder last modified .      
    private var modifiedDate : Date?;
    
    // Field of size. File or folder size.      
    private var size : Int64?;
    
    // Field of path. File or folder path.      
    private var path : String?;
        
    private enum CodingKeys: String, CodingKey {
        case name;
        case isFolder;
        case modifiedDate;
        case size;
        case path;
        case invalidCodingKey;
    }
        
    public init() {
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.name = try container.decodeIfPresent(String.self, forKey: .name);
        self.isFolder = try container.decode(Bool.self, forKey: .isFolder);
        self.modifiedDate = try container.decodeIfPresent(Date.self, forKey: .modifiedDate);
        self.size = try container.decode(Int64.self, forKey: .size);
        self.path = try container.decodeIfPresent(String.self, forKey: .path);
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.name != nil) {
            try container.encode(self.name, forKey: .name);
        }
        if (self.isFolder == nil) {
            throw AssemblyAPIError.requiredArgumentError(argumentName: "isFolder");
        }
        try container.encode(self.isFolder, forKey: .isFolder);
        if (self.modifiedDate != nil) {
            try container.encode(self.modifiedDate, forKey: .modifiedDate);
        }
        if (self.size == nil) {
            throw AssemblyAPIError.requiredArgumentError(argumentName: "size");
        }
        try container.encode(self.size, forKey: .size);
        if (self.path != nil) {
            try container.encode(self.path, forKey: .path);
        }
    }
    
    // Sets name. File or folder name.  
    public func setName(name : String?) {
        self.name = name;
    }
    
    // Gets name. File or folder name.  
    public func getName() -> String? {
        return self.name;
    }
    
    // Sets isFolder. True if it is a folder.  
    public func setIsFolder(isFolder : Bool) {
        self.isFolder = isFolder;
    }
    
    // Gets isFolder. True if it is a folder.  
    public func getIsFolder() -> Bool {
        return self.isFolder!;
    }
    
    // Sets modifiedDate. File or folder last modified .  
    public func setModifiedDate(modifiedDate : Date?) {
        self.modifiedDate = modifiedDate;
    }
    
    // Gets modifiedDate. File or folder last modified .  
    public func getModifiedDate() -> Date? {
        return self.modifiedDate;
    }
    
    // Sets size. File or folder size.  
    public func setSize(size : Int64) {
        self.size = size;
    }
    
    // Gets size. File or folder size.  
    public func getSize() -> Int64 {
        return self.size!;
    }
    
    // Sets path. File or folder path.  
    public func setPath(path : String?) {
        self.path = path;
    }
    
    // Gets path. File or folder path.  
    public func getPath() -> String? {
        return self.path;
    }
}
