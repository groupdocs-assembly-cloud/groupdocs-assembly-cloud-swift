/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AssembleOptions.swift">
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

// Assemble options data which is using for specifying assemble options, like template name, save format, report data and etc.
public class AssembleOptions : Codable, AssemblyAPIModel {
    
    // Field of templateFileInfo. Gets or sets the template name which is located on storage.      
    private var templateFileInfo : TemplateFileInfo?;
    
    // Field of saveFormat. Gets or sets a save format for assembled document.      
    private var saveFormat : String?;
    
    // Field of reportData. Gets or sets a data for report.      
    private var reportData : String?;
    
    // Field of outputPath. Gets or sets result path of a built document.      
    private var outputPath : String?;
        
    private enum CodingKeys: String, CodingKey {
        case templateFileInfo;
        case saveFormat;
        case reportData;
        case outputPath;
        case invalidCodingKey;
    }
        
    public init() {
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.templateFileInfo = try container.decodeIfPresent(TemplateFileInfo.self, forKey: .templateFileInfo);
        self.saveFormat = try container.decodeIfPresent(String.self, forKey: .saveFormat);
        self.reportData = try container.decodeIfPresent(String.self, forKey: .reportData);
        self.outputPath = try container.decodeIfPresent(String.self, forKey: .outputPath);
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self);
        if (self.templateFileInfo != nil) {
            try container.encode(self.templateFileInfo, forKey: .templateFileInfo);
        }
        if (self.saveFormat != nil) {
            try container.encode(self.saveFormat, forKey: .saveFormat);
        }
        if (self.reportData != nil) {
            try container.encode(self.reportData, forKey: .reportData);
        }
        if (self.outputPath != nil) {
            try container.encode(self.outputPath, forKey: .outputPath);
        }
    }
    
    // Sets templateFileInfo. Gets or sets the template name which is located on storage.  
    public func setTemplateFileInfo(templateFileInfo : TemplateFileInfo?) {
        self.templateFileInfo = templateFileInfo;
    }
    
    // Gets templateFileInfo. Gets or sets the template name which is located on storage.  
    public func getTemplateFileInfo() -> TemplateFileInfo? {
        return self.templateFileInfo;
    }
    
    // Sets saveFormat. Gets or sets a save format for assembled document.  
    public func setSaveFormat(saveFormat : String?) {
        self.saveFormat = saveFormat;
    }
    
    // Gets saveFormat. Gets or sets a save format for assembled document.  
    public func getSaveFormat() -> String? {
        return self.saveFormat;
    }
    
    // Sets reportData. Gets or sets a data for report.  
    public func setReportData(reportData : String?) {
        self.reportData = reportData;
    }
    
    // Gets reportData. Gets or sets a data for report.  
    public func getReportData() -> String? {
        return self.reportData;
    }
    
    // Sets outputPath. Gets or sets result path of a built document.  
    public func setOutputPath(outputPath : String?) {
        self.outputPath = outputPath;
    }
    
    // Gets outputPath. Gets or sets result path of a built document.  
    public func getOutputPath() -> String? {
        return self.outputPath;
    }
}
