//
//  LiveView.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/16.
//

import UIKit
import PlaygroundSupport

// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
PlaygroundPage.current.liveView = LiveViewController(sceneName: "koch_curve")
