//
//  Ex+Colors.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

extension UIColor {
    public class var selectedColor  : UIColor {
        return UIColor(named: "selectedColor")   ?? UIColor.white
    }
    public class var  unselectedColor : UIColor {
        return UIColor(named: "unselectedColor")   ?? UIColor.white
    }
    public class var  background : UIColor {
        return UIColor(named: "background")   ?? UIColor.white
    }
    public class var  description : UIColor {
        return UIColor(named: "description")   ?? UIColor.white
    }
    public class var  backgroundNavBar : UIColor {
        return UIColor(named: "backgroundNavBar")   ?? UIColor.white
    }
}

