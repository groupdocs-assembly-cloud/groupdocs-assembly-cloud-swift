import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AssemblyApiTests.allTests),
        testCase(StorageTests.allTests),
    ]
}
#endif
