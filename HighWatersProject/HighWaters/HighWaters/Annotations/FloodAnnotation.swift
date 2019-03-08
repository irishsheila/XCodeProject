//
//  FloodAnnotation.swift
//  HighWaters
//
//  Created by Sheila Doherty on 3/8/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class FloodAnnotation: MKPointAnnotation {
    let flood: Flood
    init(_ flood: Flood) {
        self.flood = flood
    }
}
