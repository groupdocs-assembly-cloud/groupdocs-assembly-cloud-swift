//
//  FormParameter.swift
//  GroupDocsAssemblyCloud
//
//  Created by Mikhail Danchenko on 15/04/2019.
//  Copyright © 2019 GroupDocs. All rights reserved.
//

import Foundation

public class FormParameter {
    public let Value : Any?
    public let Key: String
    
    init(key: String, value: Any?) {
        self.Value = value
        self.Key = key
    }
}
