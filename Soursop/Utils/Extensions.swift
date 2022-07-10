//
//  Extensions.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/28/22.
//

import UIKit
extension UIApplication {
    
    //used on our searchbar
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
