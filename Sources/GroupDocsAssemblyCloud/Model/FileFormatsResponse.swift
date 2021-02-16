/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="FileFormatsResponse.swift">
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

// Response with file formats.
public class FileFormatsResponse : AssemblyResponse {
    
    // Field of fileFormats. Gets or sets file formats.      
    private var fileFormats : FormatCollection?;
    
    // Field of code. Gets response status code.      
    private var code : Int?;
    
    // Field of status. Gets or sets response status.      
    private var status : String?;
        
    private enum CodingKeys: String, CodingKey {
        case fileFormats;
        case code;
        case status;
        case invalidCodingKey;
    }
        
    public override init() {
        super.init();
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder);
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.fileFormats = try container.decodeIfPresent(FormatCollection.self, forKey: .fileFormats);
        self.code = try container.decodeIfPresent(Int.self, forKey: .code);
        self.status = try container.decodeIfPresent(String.self, forKey: .status);
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder);
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.fileFormats != nil) {
            try container.encode(self.fileFormats, forKey: .fileFormats);
        }
        if (self.code != nil) {
            try container.encode(self.code, forKey: .code);
        }
        if (self.status != nil) {
            try container.encode(self.status, forKey: .status);
        }
    }
    
    // Sets fileFormats. Gets or sets file formats.  
    public func setFileFormats(fileFormats : FormatCollection?) {
        self.fileFormats = fileFormats;
    }
    
    // Gets fileFormats. Gets or sets file formats.  
    public func getFileFormats() -> FormatCollection? {
        return self.fileFormats;
    }
    
    // Sets code. Gets response status code.  
    public func setCode(code : Int?) {
        self.code = code;
    }
    
    // Gets code. Gets response status code.  
    public func getCode() -> Int? {
        return self.code;
    }
    
    // Sets status. Gets or sets response status.  
    public func setStatus(status : String?) {
        self.status = status;
    }
    
    // Gets status. Gets or sets response status.  
    public func getStatus() -> String? {
        return self.status;
    }
}
