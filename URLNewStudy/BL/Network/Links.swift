//
//  Links.swift
//  URLNewStudy
//
//  Created by Акира on 15.01.2024.
//

import Foundation

enum Links: String, CaseIterable {
   
    case neko
    case shinobu
    case megumin
    case bully
    case cuddle
    case cry
    case hug
    case awoo
    case kiss
    case lick
    case pat
    case smug
    case bonk
    case yeet
    case blush
    case smile
    case wave
    case highfive
    case handhold
    case nom
    case bite
    case glomp
    case slap
    case kill
    case kick
    case happy
    case wink
    case poke
    case dance
    
    var url: URL {
        
        switch self {
            
        case .neko:
            return URL(string: "https://api.waifu.pics/sfw/waifuneko")!
        case .shinobu:
            return URL(string: "https://api.waifu.pics/sfw/shinobu")!
        case .megumin:
            return URL(string: "https://api.waifu.pics/sfw/megumin")!
        case .bully:
            return URL(string: "https://api.waifu.pics/sfw/bully")!
        case .cuddle:
            return URL(string: "https://api.waifu.pics/sfw/cuddle")!
        case .cry:
            return URL(string: "https://api.waifu.pics/sfw/cry")!
        case .hug:
            return URL(string: "https://api.waifu.pics/sfw/hug")!
        case .awoo:
            return URL(string: "https://api.waifu.pics/sfw/awoo")!
        case .kiss:
            return URL(string: "https://api.waifu.pics/sfw/kiss")!
        case .lick:
            return URL(string: "https://api.waifu.pics/sfw/lick")!
        case .pat:
            return URL(string: "https://api.waifu.pics/sfw/pat")!
        case .smug:
            return URL(string: "https://api.waifu.pics/sfw/smug")!
        case .bonk:
            return URL(string: "https://api.waifu.pics/sfw/bonk")!
        case .yeet:
            return URL(string: "https://api.waifu.pics/sfw/yeet")!
        case .blush:
            return URL(string: "https://api.waifu.pics/sfw/blush")!
        case .smile:
            return URL(string: "https://api.waifu.pics/sfw/smile")!
        case .wave:
            return URL(string: "https://api.waifu.pics/sfw/wave")!
        case .highfive:
            return URL(string: "https://api.waifu.pics/sfw/highfive")!
        case .handhold:
            return URL(string: "https://api.waifu.pics/sfw/handhold")!
        case .nom:
            return URL(string: "https://api.waifu.pics/sfw/nom")!
        case .bite:
            return URL(string: "https://api.waifu.pics/sfw/bite")!
        case .glomp:
            return URL(string: "https://api.waifu.pics/sfw/glomp")!
        case .slap:
            return URL(string: "https://api.waifu.pics/sfw/slap")!
        case .kill:
            return URL(string: "https://api.waifu.pics/sfw/kill")!
        case .kick:
            return URL(string: "https://api.waifu.pics/sfw/kick")!
        case .happy:
            return URL(string: "https://api.waifu.pics/sfw/happy")!
        case .wink:
            return URL(string: "https://api.waifu.pics/sfw/wink")!
        case .poke:
            return URL(string: "https://api.waifu.pics/sfw/poke")!
        case .dance:
            return URL(string: "https://api.waifu.pics/sfw/dance")!
        }
    }
    
}

