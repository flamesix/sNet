//
//  CollectionViewLayout.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.06.2022.
//

import UIKit

class CollectionViewLayout: UICollectionViewLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
}
