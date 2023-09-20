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
        view.addSubview(hotView)
        hotView.translatesAutoresizingMaskIntoConstraints = false
        hotView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hotView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hotView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        hotView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
