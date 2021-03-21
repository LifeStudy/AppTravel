//
//  File.swift
//  App Viagens
//
//  Created by ArjMaster on 19/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

@objcMembers class PacoteViagem: NSObject {
    let nomeDoHotel:String
    let descricao:String
    let dataViagem:String
    let viagem:Viagem

    init(nomeDoHotel:String, descricao:String, dataViagem:String, viagem:Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
}
