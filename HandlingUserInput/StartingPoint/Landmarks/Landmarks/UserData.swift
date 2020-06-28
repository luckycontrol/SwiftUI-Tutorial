//
//  UserData.swift
//  Landmarks
//
//  Created by 조종운 on 2020/06/28.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
