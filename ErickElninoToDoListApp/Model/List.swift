//
//  List.swift
//  ErickElninoToDoListApp
//
//  Created by El nino Cholo on 2020/07/02.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import Foundation
import RealmSwift

class item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var checked: Bool = false
    var parentOfItem = LinkingObjects(fromType: Category.self, property: "myLists")
}
