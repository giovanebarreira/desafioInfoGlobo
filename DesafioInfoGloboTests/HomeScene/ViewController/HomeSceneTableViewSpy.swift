//
//  HomeSceneTableViewSpy.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import UIKit

class HomeSceneTableViewSpy: UITableView {
    
    var didSelectRowCalled = false
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowCalled = true
    }
}

