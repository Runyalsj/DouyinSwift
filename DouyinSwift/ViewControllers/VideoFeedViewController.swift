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
        hotView.hotTtile = "上升热点:  我该怎么形容她呢 | 183.4万人在看"
        
        view.addSubview(hotView)
        hotView.translatesAutoresizingMaskIntoConstraints = false
        hotView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hotView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hotView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        hotView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    }
    
    func addContentView() {
        let avatarView = AvatarView()
        // 设置头像、昵称、心情描述、内容和头饰的内容
        avatarView.avatarImageName = "avatar"
        avatarView.nickname = "@文案阁"
        avatarView.mood = "1分钟前 广州"
        avatarView.content = "她很悲观，她总是很晚才睡。\n\n别人总说她性子开朗又乐观，但只有她自己知道\n\n她内心一片荒芜，寸草不生。\n她总会莫名其妙的掉眼泪。\n她总喜欢把很多事情往最坏的方向去想。\n\n她就算流着眼泪，哭到室息也会嘴硬的说哈哈哈。\n\n她很独立，能自己做的事情绝对不会求助他人。她发起火来会说脏话，但也经常和别人说谢谢。她多愁善感又敏感焦虑，她果断又优柔寡断。她矛盾又清醒，她对任何事情都充满了期待。\n\n\n她勇敢却又胆小，没人愿意拾起那个破碎的她。\n\n她是个可以治愈别人的人，却治愈不了她自己.她无限的去表达自己又隐藏自己。她多么希望\n\n有人能看到她大大例的外壳里包裹着腐朽生锈的灵魂。\n\n我很想救她，可她是我自己。"
        avatarView.accessoryImageName = "avatarEffec"
        
        // 将头像组件视图添加到主视图上
        view.addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarView.bottomAnchor.constraint(equalTo: hotView.topAnchor),
            avatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // 更新内容文本后，调用 layoutIfNeeded() 来触发更新布局
        avatarView.layoutIfNeeded()

    }
    
}
