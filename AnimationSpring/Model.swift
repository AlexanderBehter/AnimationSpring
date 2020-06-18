//
//  Model.swift
//  AnimationSpring
//
//  Created by Александр Бехтер on 18.06.2020.
//  Copyright © 2020 Alexander Bekhter. All rights reserved.
//

struct Model {
    let name: String
    let curve: String
    let force: Int
    let duration: Int
}

extension Model {
    
    static func getListAnimation() -> [Model] {
        var listAnimation: [Model] = []
        
        for index in 0..<DataManager.shared.animationNames.count {
            let animation = Model(name: DataManager.shared.animationNames[index],
                                  curve: DataManager.shared.curveValue[index],
                                  force: DataManager.shared.forceAnimation,
                                  duration: DataManager.shared.duration)
            listAnimation.append(animation)
        }
        return listAnimation
    }
}
