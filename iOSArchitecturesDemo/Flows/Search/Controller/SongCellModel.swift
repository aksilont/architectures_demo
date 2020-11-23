//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 22.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let title: String
    let artist: String?
    let collection: String?
}

final class SongCellModelFactory {
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                             artist: model.artistName,
                             collection: model.collectionName)
    }
}
