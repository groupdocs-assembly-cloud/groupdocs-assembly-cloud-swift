import XCTest
@testable import GroupDocsAssemblyCloud

class AssemblyApiTests: BaseTestContext {
    static var allTests = [
        ("testAssembleDocument", testAssembleDocument),
    ];
    
    func getRemoteDataFolder(action : String) -> String {
        return super.getRemoteTestDataFolder() + "Assemble/" + action;
    }
    
    func testAssembleDocument() throws {
        let localName = "TestAllChartTypes.docx";
        let remoteName = "TestAllChartTypes.docx";
        let fullName = (getRemoteDataFolder(action: "AssembleDocument") + "/" + remoteName);
        
        let templateFileInfo = TemplateFileInfo();
        templateFileInfo.setFilePath(filePath: fullName);
        let data = self.getLocalTestDataFolder()
            .appendingPathComponent("Teams.json", isDirectory: false);
        let reportData = try String(contentsOf: data, encoding: .utf8)
        let assembleOptionsData = AssembleOptions();
        assembleOptionsData.setTemplateFileInfo(templateFileInfo: templateFileInfo);
        assembleOptionsData.setSaveFormat(saveFormat: "docx");
        assembleOptionsData.setReportData(reportData: reportData);
        
        try super.uploadFile(file: self.getLocalTestDataFolder().appendingPathComponent(localName, isDirectory: false), path: fullName);
        let request = AssembleDocumentRequest(assembleOptions: assembleOptionsData);
        let actual = try super.getApi().assembleDocument(request: request);
        XCTAssert(actual.count > 0);
    }
}