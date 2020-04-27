/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="Format.swift">
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

// Format description.
public class Format : Codable, AssemblyAPIModel {
    
    // Field of fileFormat. Gets or sets file format.      
    private var fileFormat : String?;
    
    // Field of _extension. Gets or sets file extension.      
    private var _extension : String?;
        
    private enum CodingKeys: String, CodingKey {
        case fileFormat;
        case _extension;
        case invalidCodingKey;
    }
        
    public init() {
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.fileFormat = try container.decodeIfPresent(String.self, forKey: .fileFormat);
        self._extension = try container.decodeIfPresent(String.self, forKey: ._extension);
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.fileFormat != nil) {
            try container.encode(self.fileFormat, forKey: .fileFormat);
        }
        if (self._extension != nil) {
            try container.encode(self._extension, forKey: ._extension);
        }
    }
    
    // Sets fileFormat. Gets or sets file format.  
    public func setFileFormat(fileFormat : String?) {
        self.fileFormat = fileFormat;
    }
    
    // Gets fileFormat. Gets or sets file format.  
    public func getFileFormat() -> String? {
        return self.fileFormat;
    }
    
    // Sets _extension. Gets or sets file extension.  
    public func setExtension(_extension : String?) {
        self._extension = _extension;
    }
    
    // Gets _extension. Gets or sets file extension.  
    public func getExtension() -> String? {
        return self._extension;
    }
}
