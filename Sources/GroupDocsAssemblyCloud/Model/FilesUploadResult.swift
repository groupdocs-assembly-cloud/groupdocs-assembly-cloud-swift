/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="FilesUploadResult.swift">
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

// File upload result
public class FilesUploadResult : Codable, AssemblyAPIModel {
    
    // Field of uploaded. List of uploaded file names      
    private var uploaded : [String]?;
    
    // Field of errors. List of errors.      
    private var errors : [ModelError]?;
        
    private enum CodingKeys: String, CodingKey {
        case uploaded;
        case errors;
        case invalidCodingKey;
    }
        
    public init() {
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.uploaded = try container.decodeIfPresent([String].self, forKey: .uploaded);
        self.errors = try container.decodeIfPresent([ModelError].self, forKey: .errors);
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.uploaded != nil) {
            try container.encode(self.uploaded, forKey: .uploaded);
        }
        if (self.errors != nil) {
            try container.encode(self.errors, forKey: .errors);
        }
    }
    
    // Sets uploaded. List of uploaded file names  
    public func setUploaded(uploaded : [String]?) {
        self.uploaded = uploaded;
    }
    
    // Gets uploaded. List of uploaded file names  
    public func getUploaded() -> [String]? {
        return self.uploaded;
    }
    
    // Sets errors. List of errors.  
    public func setErrors(errors : [ModelError]?) {
        self.errors = errors;
    }
    
    // Gets errors. List of errors.  
    public func getErrors() -> [ModelError]? {
        return self.errors;
    }
}
