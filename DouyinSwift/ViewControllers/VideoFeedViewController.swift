//
//  VideoFeedViewController.swift
//  DouyinSwift
//
//  Created by 赵福成 on 2019/5/23.
//  Copyright © 2019 zhaofucheng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MediaPlayer

class VideoFeedViewController: UIViewController {
    
    fileprivate var currentSubject: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    fileprivate var bag: DisposeBag = DisposeBag()
    fileprivate var currentObserver: Disposable?
    fileprivate let hotView: HotRankingView
    
    var tableView: UITableView
    let viewModel: VideoListViewModel = VideoListViewModel(style: .feed)
    
    required init() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        hotView = HotRankingView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHotView()
        addContentView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

extension VideoFeedViewController {
    func addBackgroundImage() {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "img_video_loading_max375x685")
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func addHotView() {
        hotView.hotTtile = "热榜: 说说你最近的状态  | 9788.2万人在看"
        
        view.addSubview(hotView)
        hotView.translatesAutoresizingMaskIntoConstraints = false
        hotView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        hotView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        hotView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        hotView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    }
    
    func addContentView() {
        let avatarView = AvatarView()
        // 设置头像、昵称、心情描述、内容和头饰的内容
        avatarView.avatarImageName = "avatar"
        avatarView.nickname = "@文案阁"
        avatarView.mood = "1分钟前 广州"
//        avatarView.accessoryImageName = "avatarEffec"
        avatarView.content = "我爱了他四次 第一次 开始他把我捧在手心里 第二次 我看到了他所有缺点 还是相信他说的 他会改 第三次 明明知道两个人之间有隔阂了 即使每次都会流泪自己消化情绪可依旧相信他 第四次 他我行我素空有一张说爱我的嘴一百个不爱我的细节 我真正意识到无法再继续下去的时候 我决定结束了"
        
        
        // 将头像组件视图添加到主视图上
        view.addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarView.bottomAnchor.constraint(equalTo: hotView.topAnchor, constant: 0),
            avatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // 更新内容文本后，调用 layoutIfNeeded() 来触发更新布局
        avatarView.layoutIfNeeded()

    }
    
}
