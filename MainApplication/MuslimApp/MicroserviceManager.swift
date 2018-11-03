//
//  MicroserviceManager.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import SubApplication

// SubApplications
import AgendaMuslim
import LowonganKerjaMuslim
import AmalanYaumiyah
import KakakAsuh
import CatatanMuslim
import JadwalShalat

final class MicroserviceManager {
    static let shared = MicroserviceManager()
    private init() {}
    
    lazy var applications: [SubApplication] = [
        AgendaMuslim.Application(),
        LowonganKerjaMuslim.Application(),
        AmalanYaumiyah.Application(),
        KakakAsuh.Application(),
        CatatanMuslim.Application(),
        JadwalShalat.Application()
    ]
}

