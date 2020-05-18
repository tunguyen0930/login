//
//  UserDefaultExtension.swift
//  testlogin
//
//  Created by Nguyen Anh Tu on 5/19/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import Foundation

extension UserDefaults {
    func setValue(value: Bool?) {
        if value != nil {
            UserDefaults.standard.set(value, forKey: "success")
        } else {
            UserDefaults.standard.removeObject(forKey: "success")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getValue() -> Bool? {
        return UserDefaults.standard.value(forKey: "success") as? Bool
    }
}
