
//  CategoryIcons.swift
//  notifyme
//
//  Created by Dembo on 12/11/2025.
//

import Foundation
import SwiftUI

enum CategoryIcon: String, CaseIterable, Identifiable {
    
    case figure2andchildholdinghands
    case figureaustralianfootball
    case figuredance
    case figurediscsports
    case figureequestriansports
    case figureroll
    case figureskiingdownhill
    case airplaneupright
    case brainfilledheadprofile
    case carrearfill
    case dollarsign
    case eyeglasses
    case figurestanddress
    case gamecontrollerfill
    case heartfill
    case motorcyclefill
    
    
    
    
    
    var id: String { rawValue }
    var resource: ImageResource {
        switch self {
        
        case .figure2andchildholdinghands: return .figure2AndChildHoldinghands
        case .figureaustralianfootball: return .figureAustralianFootball
        case .figuredance: return .figureDance
        case .figurediscsports: return .figureDiscSports
        case .figureequestriansports: return .figureEquestrianSports
        case .figureroll: return .figureRoll
        case .figureskiingdownhill: return .figureSkiingDownhill
        case .airplaneupright: return .airplaneUpRight
        case .brainfilledheadprofile: return .brainFilledHeadProfile
        case .carrearfill: return .carRearFill
        case .dollarsign: return .dollarsign
        case .eyeglasses: return .eyeglasses
        case .figurestanddress: return .figureStandDress
        case .gamecontrollerfill: return .gamecontrollerFill
        case .heartfill: return .heartFill
        case .motorcyclefill: return .motorcycleFill
        }
    }
    
    var image: Image { Image(resource) }
    func getIconWith(_ string: String) -> CategoryIcon {
        CategoryIcon(rawValue: string) ?? .figure2andchildholdinghands
    }
    
}

#Preview{
    ScrollView {
        ForEach(CategoryIcon.allCases, id: \.self) { icon in
            icon.image
        }
        .padding()
        .padding(.horizontal, 200)
    }
}
