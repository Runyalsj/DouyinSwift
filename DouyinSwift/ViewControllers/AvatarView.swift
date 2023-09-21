import UIKit

class AvatarView: UIView {
    
    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let moodLabel = UILabel()
    let contentLabel = UILabel()
    let accessoryImageView = UIImageView()
    var viewHeightConstraint: NSLayoutConstraint?
    
    // 头像图片名称
    var avatarImageName: String? {
        didSet {
            if let imageName = avatarImageName {
                avatarImageView.image = UIImage(named: imageName)
            } else {
                avatarImageView.image = nil
            }
        }
    }
    
    // 昵称文本
    var nickname: String? {
        didSet {
            nameLabel.text = nickname
        }
    }
    
    // 心情描述文本
    var mood: String? {
        didSet {
            moodLabel.text = mood
        }
    }
    
    // 内容文本
    var content: String? {
        didSet {
            contentLabel.text = content
            updateContentLabelHeight()
        }
    }
    
    // 头饰图片名称
    var accessoryImageName: String? {
        didSet {
            if let imageName = accessoryImageName {
                accessoryImageView.image = UIImage(named: imageName)
            } else {
                accessoryImageView.image = nil
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    func setupUI() {
        // 设置头像图片
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.borderColor = .white
        avatarImageView.borderWidth  = 1
        
        // 设置昵称文本
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textColor = UIColor.white
        
        // 设置心情描述文本
        moodLabel.font = UIFont.systemFont(ofSize: 12)
        moodLabel.textColor = UIColor.lightGray
        
        // 设置内容文本
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textColor = UIColor.white
        contentLabel.numberOfLines = 0
        
        // 设置头饰图片
        accessoryImageView.contentMode = .scaleAspectFit
//        accessoryImageView.borderWidth = 1
//        accessoryImageView.borderColor = .yellow
        accessoryImageView.clipsToBounds = true
        
        // 将头像、昵称、心情描述、内容和头饰添加到自定义视图中
        addSubview(avatarImageView)
        addSubview(accessoryImageView)
        addSubview(nameLabel)
        addSubview(moodLabel)
        addSubview(contentLabel)
        
        // 设置头像、昵称、心情描述、内容和头饰的布局约束
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        accessoryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            accessoryImageView.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            accessoryImageView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            accessoryImageView.widthAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.4),
            accessoryImageView.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1.4),
            
            nameLabel.leadingAnchor.constraint(equalTo: accessoryImageView.trailingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            moodLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            moodLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            
            contentLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
            
            
        ])
        accessoryImageView.layoutIfNeeded()
        avatarImageView.layoutIfNeeded()
        accessoryImageView.cornerRadius = accessoryImageView.height / 2
        avatarImageView.cornerRadius = avatarImageView.height / 2
        
        // 设置视图高度约束
        viewHeightConstraint = heightAnchor.constraint(equalToConstant: 0)
        viewHeightConstraint?.isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateContentLabelHeight()
    }
    
    func updateContentLabelHeight() {
        guard let contentText = contentLabel.text else { return }
        
        let contentWidth = bounds.width - avatarImageView.bounds.width - accessoryImageView.bounds.width - 16
        let contentSize = contentText.boundingRect(with: CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: contentLabel.font!], context: nil)
        contentLabel.frame.size.height = ceil(contentSize.height)
        updateViewHeight()
    }
    
    func updateViewHeight() {
        let height = contentLabel.frame.maxY + 8
        viewHeightConstraint?.constant = height
    }
}
