//
//  PacoteViagemCollectionViewCell.swift
//  App Viagens
//
//  Created by ArjMaster on 17/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    
    func setupCellCollection(pacote: PacoteViagem){
        labelTitulo.text =  pacote.viagem.titulo
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        labelQuantidadeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
    
}
