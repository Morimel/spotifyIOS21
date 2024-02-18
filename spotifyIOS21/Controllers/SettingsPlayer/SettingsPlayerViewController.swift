//
//  SettingsPlayerViewController.swift
//  spotifyIOS21
//
//  Created by Isa Melsov on 18/2/24.
//

import UIKit

class SettingsPlayerViewController: UIViewController {
    
    var Playerimage: UIImageView!
    var SongLabel: UILabel!
    var SingerLabel: UILabel!
    var DotLabel: UILabel!
    var AlbumLabel: UILabel!
    var ShuffleBtn: UIButton!
    var RepeatBtn: UIButton!
    var QueueBtn: UIButton!
    var LikeBtn: UIButton!
    var AddBtn: UIButton!
    var AddQueue: UIButton!
    var ShareBtn: UIButton!
    var CloseBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .light) // Выберите стиль заблуривания, который вам нравится
               let blurEffectView = UIVisualEffectView(effect: blurEffect)
               blurEffectView.frame = view.bounds
               blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
               view.addSubview(blurEffectView)
        
        Playerimage = UIImageView()
        Playerimage.translatesAutoresizingMaskIntoConstraints = false
                let image = UIImage(named: "User")
        Playerimage.image = image
        Playerimage.contentMode = .scaleAspectFit

        view.addSubview(Playerimage)
        
        SongLabel = UILabel()
        SongLabel.text = "Song"
        SongLabel.translatesAutoresizingMaskIntoConstraints = false
        SongLabel.textColor = .white
        SongLabel.numberOfLines = 0
        SongLabel.font = .boldSystemFont(ofSize: 18)
        
        view.addSubview(SongLabel)
        
        SingerLabel = UILabel()
        SingerLabel.text = "Singer"
        SingerLabel.translatesAutoresizingMaskIntoConstraints = false
        SingerLabel.textColor = .gray
        SingerLabel.numberOfLines = 0
        SingerLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(SingerLabel)
        
        DotLabel = UILabel()
        DotLabel.text = "•"
        DotLabel.translatesAutoresizingMaskIntoConstraints = false
        DotLabel.textColor = .gray
        
        view.addSubview(DotLabel)
        
        AlbumLabel = UILabel()
        AlbumLabel.text = "Album"
        AlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        AlbumLabel.textColor = .gray
        AlbumLabel.numberOfLines = 0
        AlbumLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(AlbumLabel)
        
        
        ShuffleBtn = UIButton()
        ShuffleBtn.setTitle ("Shuffle", for: .normal)
        ShuffleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        ShuffleBtn.titleEdgeInsets = UIEdgeInsets(top: 25, left: -ShuffleBtn.imageView!.frame.size.width, bottom: -ShuffleBtn.imageView!.frame.size.height - 10, right: 0)
        ShuffleBtn.translatesAutoresizingMaskIntoConstraints = false
        ShuffleBtn.setImage(UIImage(named: "shuffle"), for: .normal)
        ShuffleBtn.imageView?.contentMode = .scaleAspectFit
        ShuffleBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        view.addSubview(ShuffleBtn)
        
        RepeatBtn = UIButton()
        RepeatBtn.setTitle ("Repeat", for: .normal)
        RepeatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        RepeatBtn.titleEdgeInsets = UIEdgeInsets(top: 25, left: -RepeatBtn.imageView!.frame.size.width, bottom: -RepeatBtn.imageView!.frame.size.height - 10, right: 0)
        RepeatBtn.translatesAutoresizingMaskIntoConstraints = false
        RepeatBtn.setImage(UIImage(named: "Union")?.withRenderingMode(.alwaysTemplate), for: .normal)
        RepeatBtn.imageView?.contentMode = .scaleToFill
        RepeatBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        RepeatBtn.imageView?.tintColor = UIColor.white

        view.addSubview(RepeatBtn)
        
        QueueBtn = UIButton()
        QueueBtn.setTitle ("Go to queue", for: .normal)
        QueueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        QueueBtn.titleEdgeInsets = UIEdgeInsets(top: 25, left: -QueueBtn.imageView!.frame.size.width, bottom: -QueueBtn.imageView!.frame.size.height - 10, right: 0)
        QueueBtn.translatesAutoresizingMaskIntoConstraints = false
        QueueBtn.setImage(UIImage(named: "queue")?.withRenderingMode(.alwaysTemplate), for: .normal)
        QueueBtn.imageView?.contentMode = .scaleAspectFit
        QueueBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        QueueBtn.imageView?.tintColor = UIColor.white

        view.addSubview(QueueBtn)
        
        LikeBtn = UIButton()
                LikeBtn.setTitle ("Like", for: .normal)
                LikeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
                LikeBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -LikeBtn.imageView!.frame.size.width, bottom: -LikeBtn.imageView!.frame.size.height - 10, right: -10)
                LikeBtn.translatesAutoresizingMaskIntoConstraints = false
                LikeBtn.setImage(UIImage(named: "Like")?.withRenderingMode(.alwaysTemplate), for: .normal)
                LikeBtn.imageView?.contentMode = .scaleAspectFit
                LikeBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                LikeBtn.imageView?.tintColor = UIColor.white

        view.addSubview(LikeBtn)
        
        AddBtn = UIButton()
        AddBtn.setTitle ("Add to playlist", for: .normal)
        AddBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        AddBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -AddBtn.imageView!.frame.size.width, bottom: -AddBtn.imageView!.frame.size.height - 10, right: -10)
        AddBtn.translatesAutoresizingMaskIntoConstraints = false
        AddBtn.setImage(UIImage(named: "Add")?.withRenderingMode(.alwaysTemplate), for: .normal)
        AddBtn.imageView?.contentMode = .scaleAspectFit
        AddBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        AddBtn.imageView?.tintColor = UIColor.white

        view.addSubview(AddBtn)
        
        AddQueue = UIButton()
        AddQueue.setTitle ("Add to queue", for: .normal)
        AddQueue.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        AddQueue.titleEdgeInsets = UIEdgeInsets(top: 0, left: -AddQueue.imageView!.frame.size.width, bottom: -AddQueue.imageView!.frame.size.height - 10, right: -10)
        AddQueue.translatesAutoresizingMaskIntoConstraints = false
        AddQueue.setImage(UIImage(named: "AddQ")?.withRenderingMode(.alwaysTemplate), for: .normal)
        AddQueue.imageView?.contentMode = .scaleAspectFit
        AddQueue.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        AddQueue.imageView?.tintColor = UIColor.white

        view.addSubview(AddQueue)
        
        ShareBtn = UIButton()
        ShareBtn.setTitle ("Share", for: .normal)
        ShareBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        ShareBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -ShareBtn.imageView!.frame.size.width, bottom: -ShareBtn.imageView!.frame.size.height - 10, right: -10)
        ShareBtn.translatesAutoresizingMaskIntoConstraints = false
        ShareBtn.setImage(UIImage(named: "Share")?.withRenderingMode(.alwaysTemplate), for: .normal)
        ShareBtn.imageView?.contentMode = .scaleAspectFit
        ShareBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        ShareBtn.imageView?.tintColor = UIColor.white

        view.addSubview(ShareBtn)
        
        CloseBtn = UIButton()
        CloseBtn.setTitle ("Close", for: .normal)
        CloseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        CloseBtn.translatesAutoresizingMaskIntoConstraints = false
        CloseBtn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        

        view.addSubview(CloseBtn)

        
        NSLayoutConstraint.activate([
            Playerimage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            Playerimage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            Playerimage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            Playerimage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550),
            Playerimage.widthAnchor.constraint(equalToConstant: 100),
            Playerimage.heightAnchor.constraint(equalToConstant: 100),
            
            SongLabel.topAnchor.constraint(equalTo: Playerimage.bottomAnchor, constant: 12),
            SongLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            SingerLabel.topAnchor.constraint(equalTo: SongLabel.bottomAnchor, constant: 10),
            SingerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            DotLabel.topAnchor.constraint(equalTo: SongLabel.bottomAnchor, constant: 6),
            DotLabel.leftAnchor.constraint(equalTo: SingerLabel.rightAnchor, constant: 6),
            
            AlbumLabel.topAnchor.constraint(equalTo: SongLabel.bottomAnchor, constant: 10),
            AlbumLabel.leftAnchor.constraint(equalTo: DotLabel.rightAnchor, constant: 6),
            
            ShuffleBtn.topAnchor.constraint(equalTo: SingerLabel.bottomAnchor, constant: 35),
            ShuffleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            RepeatBtn.topAnchor.constraint(equalTo: SingerLabel.bottomAnchor, constant: 35),
            RepeatBtn.leftAnchor.constraint(equalTo: ShuffleBtn.rightAnchor, constant: 35),
            
            QueueBtn.topAnchor.constraint(equalTo: SingerLabel.bottomAnchor, constant: 35),
            QueueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            LikeBtn.topAnchor.constraint(equalTo: ShuffleBtn.bottomAnchor, constant: 55),
            LikeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            AddBtn.topAnchor.constraint(equalTo: LikeBtn.bottomAnchor, constant: 55),
            AddBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            AddQueue.topAnchor.constraint(equalTo: AddBtn.bottomAnchor, constant: 55),
            AddQueue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            ShareBtn.topAnchor.constraint(equalTo: AddQueue.bottomAnchor, constant: 55),
            ShareBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            CloseBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            CloseBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                ])
    }
    
    @objc func closeButtonTapped() {
        
           dismiss(animated: true, completion: nil)
       }
   }
