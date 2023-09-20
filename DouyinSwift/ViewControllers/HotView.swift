//
//  HotView.swift
//  DouyinSwift
//
//  Created by Runyalsj on 2023/9/21.
//  Copyright © 2023 zhaofucheng. All rights reserved.
//

import Foundation
import UIKit

class HotRankingView: UIView {
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    func setupUI() {
        // 设置图标图片
        let originalImage = UIImage(named: "fire_icon12x16") // 原始图片

        if let cgImage = originalImage?.cgImage {
            let flippedImage = UIImage(cgImage: cgImage, scale: originalImage!.scale, orientation: .upMirrored)
            iconImageView.image = flippedImage
            iconImageView.contentMode = .scaleAspectFill
            // 在这里使用 flippedImage，它是镜像后的图片
            // 例如，可以将它设置为 UIImageView 的 image 属性或进行其他操作
        }
        
        // 设置标题文本
        titleLabel.text = "热榜: 多么美好的一天啊 | 8893.6万人在看"
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.yellow
        
        // 将图标和标题添加到自定义视图中
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        // 设置图标和标题的布局约束
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 12),
            iconImageView.heightAnchor.constraint(equalToConstant: 12),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

class ViewController: UIViewController {
    
    let hotRankingView = HotRankingView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 将热榜组件视图添加到主视图上面
        view.addSubview(hotRankingView)
        hotRankingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hotRankingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hotRankingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hotRankingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hotRankingView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
