//
//  Viagem.swift
//  App Viagens
//
//  Created by ArjMaster on 15/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    let titulo:String
    let quantidadeDeDias:String
    let preco:String
    let caminhoDaImagem:String

    init(titulo:String, quantidadeDeDias:String, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
