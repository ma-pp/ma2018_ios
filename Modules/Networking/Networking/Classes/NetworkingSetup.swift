//
//  NetworkingSetup.swift
//  Networking
//
//  Created by PondokiOS on 11/5/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Parse

public class Networking {
    public static func setup() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = ""
            $0.clientKey = ""
            $0.server = ""
        }
        
        Parse.initialize(with: configuration)
    }
}
