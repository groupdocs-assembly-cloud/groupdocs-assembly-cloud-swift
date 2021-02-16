# Aspose.Words Cloud SDK for Swift
This repository contains Aspose.Words Cloud SDK for Swift source code. This SDK allows you to work with Aspose.Words Cloud REST APIs in your Swift applications quickly and easily, with zero initial cost.

See [API Reference](https://apireference.groupdocs.cloud/assembly) for full API specification.

# Key Features
* API to Define Templates, Fetch Data Source, Insert Data in Template & Generate on the fly Reports.

## How to use the SDK?
The complete source code is available in this repository folder. You can either directly use it in your project via source code or add this repository as dependency (recommended).

### Prerequisites
To use GroupDocs.Assembly for Cloud Swift SDK you need to register an account with [GroupDocs Cloud](https://www.groupdocs.cloud/) and lookup/create App Key and SID at [Cloud Dashboard](https://dashboard.groupdocs.cloud/applications). There is free quota available. For more details, see [GroupDocs Cloud Pricing](https://purchase.groupdocs.cloud/pricing).

## Installation & Usage
Add link to this repository as dependency to your Package.swift:

```swift

dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-swift", from: "21.1"),
],
targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
        name: "YourTargetName",
        dependencies: ["GroupDocsAssemblyCloud"]
    ),
]

```

## Getting Started

```swift

import Foundation;
import GroupDocsAssemblyCloud;

let wordsApi = AssemblyApi(appSid: "YOUR_APP_SID", appKey: "YOUR_APP_KEY");
let localName = "FileName";
let remoteName = "RemoteFileName";
let fullName = (getRemoteDataFolder(action: "AssembleDocument") + "/" + remoteName);

let templateFileInfo = TemplateFileInfo();
templateFileInfo.setFilePath(filePath: fullName);
let data = self.getLocalTestDataFolder()
    .appendingPathComponent("DataFile.json", isDirectory: false);
let reportData = try String(contentsOf: data, encoding: .utf8)
let assembleOptionsData = AssembleOptions();
assembleOptionsData.setTemplateFileInfo(templateFileInfo: templateFileInfo);
assembleOptionsData.setSaveFormat(saveFormat: "docx");
assembleOptionsData.setReportData(reportData: reportData);
let request = AssembleDocumentRequest(assembleOptions: assembleOptionsData);
let actual = try super.getApi().assembleDocument(request: request);
```

[Test](Tests/GroupDocsAssemblyCloudTests) contain various examples of using the SDK.
Please put your credentials into "Settings/servercreds.json" for run tests.

## Dependencies
- Swift 4.2+
- referenced packages (see [here](Package.swift) for more details)

## Licensing
 
All GroupDocs.Assembly Cloud SDKs, helper scripts and templates are licensed under [MIT License](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-swift/blob/master/LICENSE). 

## Contact Us
[Product Page](https://products.groupdocs.cloud/assembly/swift) | [Documentation](https://docs.groupdocs.cloud/display/assemblycloud/Home) | [API Reference](https://apireference.groupdocs.cloud/assembly/) | [Code Samples](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-swift) | [Blog](https://blog.groupdocs.cloud/category/assembly/) | [Free Support](https://forum.groupdocs.cloud/c/assembly) | [Free Trial](https://dashboard.groupdocs.cloud/applications)

