//
//  Category.swift
//  ErickElninoToDoListApp
//
//  Created by El nino Cholo on 2020/07/02.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object
{
    @objc dynamic var name: String = ""
    let myLists = List<item>()
}
