import XCTest
@testable import GroupDocsAssemblyCloud

class BaseTestContext: XCTestCase {
    private var api : AssemblyAPI?;
    private var baseFolder : URL?;
    
    public func getApi() -> AssemblyAPI {
        return self.api!;
    }
    
    public func getLocalBaseFolder() -> URL {
        return self.baseFolder!;
    }
    
    public func getLocalTestDataFolder() -> URL {
        return self.baseFolder!.appendingPathComponent("TestData", isDirectory: true);
    }
    
    public func getRemoteTestDataFolder() -> String {
        return "Temp/SwiftSdkTests/TestData/";
    }
    
    public func getRemoteTestOut() -> String {
        return "SwiftTestOut";
    }
    
    public func uploadFile(file : URL, path : String) throws {
        let req = UploadFileRequest(fileContent: InputStream(url: file)!, path: path);
        let res = try getApi().uploadFile(request: req);
        XCTAssert(res.getErrors()?.count == 0);
        XCTAssert(res.getUploaded()?.count == 1);
    }
    
    override func setUp() {
        if (self.api == nil) {
            self.baseFolder = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .deletingLastPathComponent();
            
            let credsUrl = self.baseFolder!
                .appendingPathComponent("Settings", isDirectory: true)
                .appendingPathComponent("servercreds.json", isDirectory: false);
            
            do {
                let credsData = try Data(contentsOf: credsUrl);
                let config = try ObjectSerializer.deserialize(type: Configuration.self, from: credsData);
                self.api = AssemblyAPI(configuration: config);
            }
            catch {
                XCTFail("File servercreds.json not found in Settings folder of project root.");
            }
        }
    }
    
    override func tearDown() {
        
    }
}
