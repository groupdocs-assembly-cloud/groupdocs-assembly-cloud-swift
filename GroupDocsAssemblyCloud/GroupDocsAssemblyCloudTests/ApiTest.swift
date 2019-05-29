//
//  ApiTest.swift
//  GroupDocsAssemblyCloudTests
//
//  Created by Mikhail Danchenko on 06/04/2019.
//  Copyright © 2019 GroupDocs. All rights reserved.
//

import XCTest
@testable import GroupDocsAssemblyCloud

class ApiTest: GroupDocsAssemblyCloudTests{
    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testPostAssembleDocument(){
        expectation = self.expectation(description: "testPostAssembleDocument")
        let fileName = "TestAllChartTypes.docx"
        let remoteName = fileName
        uploadFile(remoteName: "TestData/\(remoteName)", localName: fileName){
            let request = PostAssembleDocumentRequest(name: remoteName, data: self.getURL("Teams.json") ?? URL(fileURLWithPath: ""), saveOptions: LoadSaveOptionsData(saveFormat: "docx"), folder: "", destFileName: "")
                                                      
            AssemblyAPI.postAssembleDocument(request: request){
                (response, error) in
                guard error == nil else {
                    XCTFail("Error occured while assembling document. \(error!.localizedDescription)")
                    return;
                }
                
                if let resonse = response {
                    XCTAssertFalse(resonse.dataRepresentation.isEmpty)
                    self.expectation?.fulfill()
                }
            }
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
}
