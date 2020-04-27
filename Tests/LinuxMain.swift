import XCTest
import SwiftTestReporter
import GroupDocsAssemblyCloudTests

_ = TestObserver();

var tests = [XCTestCaseEntry]()
tests += GroupDocsAssemblyCloudTests.allTests()
XCTMain(tests)
