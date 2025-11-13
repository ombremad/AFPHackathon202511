
//  CategoryIcons.swift
//  notifyme
//
//  Created by Dembo on 12/11/2025.
//

import Foundation
import SwiftUI

enum UserIcon: String, CaseIterable {
    
    case figure2andchildholdinghands = "figure.2.and.child.holdinghands"
    case figureaustralianfootball = "figure.australian.football"
    case figuredance = "figure.dance"
    case figurediscsports = "figure.disc.sports"
    case figureequestriansports = "figure.equestrian.sports"
    case figureroll = "figure.roll"
    case figureskiingdownhill = "figure.skiing.downhill"
    case airplaneupright = "airplane.up.right"
    case brainfilledheadprofile = "brain.filled.head.profile"
    case carrearfill = "car.rear.fill"
    case dollarsign = "dollarsign"
    case eyeglasses = "eyeglasses"
    case figurestanddress = "figure.stand.dress"
    case gamecontrollerfill = "gamecontroller.fill"
    case heartfill = "heart.fill"
    case motorcyclefill = "motorcycle.fill"
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
}

#Preview{
    ScrollView {
        ForEach(UserIcon.allCases, id: \.self) { icon in
            icon.image
        }
        .padding()
        .padding(.horizontal, 200)
    }
}
