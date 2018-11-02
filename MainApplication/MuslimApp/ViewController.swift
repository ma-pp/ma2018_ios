//
//  ViewController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
// Modules
import Networking
import Database
// SubApplication
import AgendaMuslim
import LowonganKerjaMuslim

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let agendaMuslim = AgendaMuslim.Application()
        let lokerMuslim = LowonganKerjaMuslim.Application()
        let networkingError = NetworkingError.unknown
        let databaseError = DatabaseError.unknown
        
        print("Agenda \(agendaMuslim)")
        print("Loker \(lokerMuslim)")
        print("Networking \(networkingError)")
        print("Database \(databaseError)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

