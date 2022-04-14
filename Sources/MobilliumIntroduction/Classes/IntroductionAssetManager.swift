//
//  IntroductionAssetManager.swift
//  MobilliumIntroduction
//
//  Created by Ahmet İmirze on 12.04.2022.
//

import UIKit

// MARK: - IntroductionAssetManager
public class IntroductionAssetManager {
    public static func image(_ named: String) -> UIImage {
        let bundle = Bundle(for: IntroductionAssetManager.self)
        return UIImage(named: named, in: bundle, compatibleWith: nil) ?? UIImage()
    }
}
