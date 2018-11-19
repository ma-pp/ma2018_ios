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

public final class SubApplicationManager {
    public static let shared = SubApplicationManager()
    private init() {}
    
    public lazy var applications: [SubApplication] = [
        AgendaMuslim.Application(),
        LowonganKerjaMuslim.Application(),
        AmalanYaumiyah.Application(),
        KakakAsuh.Application(),
        CatatanMuslim.Application(),
        JadwalShalat.Application()
    ]
}

