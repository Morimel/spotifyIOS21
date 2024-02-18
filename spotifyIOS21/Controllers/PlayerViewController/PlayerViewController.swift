//
//  PlayerViewController.swift
//  spotifyIOS21
//
//  Created by Isa Melsov on 18/2/24.
//

import UIKit

class PlayerViewController: UIViewController {
    var isPlaying = false
    var isPopupVisible = false

    
    let labelNameArtist: UILabel = {
        let label = UILabel()
        label.text = "Artist Name"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonSkip: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "skip"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonInfo: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Info"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        
        
        button.tintColor = .black
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 34
        return button
    }()
    
    let firstAdditionalButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondAdditionalButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "next"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.text = "SONG"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelNameArtistSong: UILabel = {
        let label = UILabel()
        label.text = "Artist Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ImageSong")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .systemGray
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        return slider
    }()
    
    let labelTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelEndTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonRepeat: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "repeat"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonRandom: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "random"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonBluetooth: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bluetooth"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonPlaylist: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Playlist"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonShare: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Share"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        updateLabelTime()
        
        isPlaying = false
        updatePlayPauseButtonImage()
        
        
        // Добавляем двойной градиент с размытием как фон
        if let gradientImage = createDoubleGradientImage() {
            let blurredImageView = UIImageView(image: gradientImage)
            blurredImageView.frame = view.bounds
            view.insertSubview(blurredImageView, at: 0)
        }
    }
    
    private func setupUI() {
        view.addSubview(playPauseButton)
        view.addSubview(firstAdditionalButton)
        view.addSubview(secondAdditionalButton)
        view.addSubview(songLabel)
        view.addSubview(albumImageView)
        view.addSubview(slider)
        view.addSubview(buttonRepeat)
        view.addSubview(buttonRandom)
        view.addSubview(labelNameArtist)
        view.addSubview(buttonSkip)
        view.addSubview(buttonInfo)
        view.addSubview(labelNameArtistSong)
        view.addSubview(buttonBluetooth)
        view.addSubview(buttonPlaylist)
        view.addSubview(buttonShare)
        view.addSubview(labelTime)
        view.addSubview(labelEndTime)
        
        buttonRandom.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        buttonPlaylist.addTarget(self, action: #selector(playlistButtonTapped), for: .touchUpInside)
        buttonShare.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        buttonBluetooth.addTarget(self, action: #selector(bluetoothButtonTapped), for: .touchUpInside)
        buttonRepeat.addTarget(self, action: #selector(repeatButtonTapped), for: .touchUpInside)
        // Внутри метода setupUI()
        buttonSkip.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            labelNameArtist.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -25),
            labelNameArtist.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Прикрепление ButtonSkip к левому краю и верхней части навигационного бара
            buttonSkip.widthAnchor.constraint(equalToConstant: 30),
            buttonSkip.heightAnchor.constraint(equalToConstant: 30),
            buttonSkip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonSkip.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -25),
            // Прикрепление ButtonInfo к правому краю и верхней части навигационного бара
            buttonInfo.widthAnchor.constraint(equalToConstant: 30),
            buttonInfo.heightAnchor.constraint(equalToConstant: 30),
            buttonInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -25),
            
            playPauseButton.widthAnchor.constraint(equalToConstant: 68),
            playPauseButton.heightAnchor.constraint(equalToConstant: 68),
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            
            firstAdditionalButton.widthAnchor.constraint(equalToConstant: 50),
            firstAdditionalButton.heightAnchor.constraint(equalToConstant: 50),
            firstAdditionalButton.trailingAnchor.constraint(equalTo: playPauseButton.leadingAnchor, constant: -25),
            firstAdditionalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            
            secondAdditionalButton.widthAnchor.constraint(equalToConstant: 50),
            secondAdditionalButton.heightAnchor.constraint(equalToConstant: 50),
            secondAdditionalButton.leadingAnchor.constraint(equalTo: playPauseButton.trailingAnchor, constant: 25),
            secondAdditionalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            
            albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            albumImageView.widthAnchor.constraint(equalToConstant: 200),
            albumImageView.heightAnchor.constraint(equalToConstant: 200),
            albumImageView.bottomAnchor.constraint(equalTo: songLabel.topAnchor, constant: -30),
            
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.bottomAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: -40),
            slider.widthAnchor.constraint(equalToConstant: 341),
            slider.heightAnchor.constraint(equalToConstant: 4),
            
            labelTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelTime.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            
            labelEndTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelEndTime.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            
            songLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            songLabel.topAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: -120),
            
            labelNameArtistSong.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 5),
            labelNameArtistSong.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonRandom.widthAnchor.constraint(equalToConstant: 50),
            buttonRandom.heightAnchor.constraint(equalToConstant: 50),
            buttonRandom.trailingAnchor.constraint(equalTo: firstAdditionalButton.leadingAnchor, constant: -27),
            buttonRandom.bottomAnchor.constraint(equalTo: buttonShare.topAnchor, constant: -30),
            
            buttonRepeat.widthAnchor.constraint(equalToConstant: 50),
            buttonRepeat.heightAnchor.constraint(equalToConstant: 50),
            buttonRepeat.leadingAnchor.constraint(equalTo: secondAdditionalButton.trailingAnchor, constant: 30),
            //buttonRepeat.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 65),
            buttonRepeat.bottomAnchor.constraint(equalTo: buttonPlaylist.topAnchor, constant: -30),
            
            buttonBluetooth.widthAnchor.constraint(equalToConstant: 100),
            buttonBluetooth.heightAnchor.constraint(equalToConstant: 30),
            buttonBluetooth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -15),
            buttonBluetooth.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            buttonPlaylist.widthAnchor.constraint(equalToConstant: 100),
            buttonPlaylist.heightAnchor.constraint(equalToConstant: 30),
            buttonPlaylist.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 18),
            buttonPlaylist.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            buttonShare.widthAnchor.constraint(equalToConstant: 100),
            buttonShare.heightAnchor.constraint(equalToConstant: 30),
            buttonShare.leadingAnchor.constraint(equalTo: buttonPlaylist.leadingAnchor, constant: -50),
            buttonShare.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -22),
        ])
        
    }
   
    
    @objc private func playPauseButtonTapped() {
        // нажатие кнопки воспроизведения здесь
        isPlaying.toggle()
        updatePlayPauseButtonImage()
        print("Play/Pause button tapped")
    }
    @objc private func miniPlayerButtonTapped() {
        // Нажатие кнопки мини-плеера
        isPlaying.toggle()
        updatePlayPauseButtonImage()
        print("Mini Player button tapped")
        
    }

    @objc private func skipButtonTapped() {
        // Создаем всплывающее окно
        let popupView = UIView()
        popupView.backgroundColor = .systemGray2 // Настройте цвет фона в соответствии с вашим дизайном
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.layer.cornerRadius = 10 // Задайте радиус скругления углов (по желанию)
        
        let albumImageView = UIImageView()
        albumImageView.backgroundColor = .black
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.image = UIImage(named: "ImageSong") // Установите изображение в соответствии с вашими данными
        albumImageView.layer.cornerRadius = 10
        albumImageView.layer.masksToBounds = true
        
        
        let labelSong = UILabel()
        labelSong.text = "Song" // Замените на ваш заголовок песни
        labelSong.textColor = .black
        labelSong.font = UIFont.boldSystemFont(ofSize: 16)
        labelSong.translatesAutoresizingMaskIntoConstraints = false
        
        let artistNameLabel = UILabel()
        artistNameLabel.text = "Artist Name" // Замените на имя вашего исполнителя
        artistNameLabel.textColor = .black
        artistNameLabel.font = UIFont.systemFont(ofSize: 14)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonMiniPlayer: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "pause"), for: .normal)
            button.tintColor = .white
            button.backgroundColor = .gray
            button.layer.cornerRadius = 25  // Подстраивайте радиус по необходимости
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(miniPlayerButtonTapped), for: .touchUpInside)
            return button
        }()


        popupView.addSubview(albumImageView)
        popupView.addSubview(labelSong)
        popupView.addSubview(artistNameLabel)
        popupView.addSubview(buttonMiniPlayer)
        
        
        NSLayoutConstraint.activate([
            
            buttonMiniPlayer.widthAnchor.constraint(equalToConstant: 50),
            buttonMiniPlayer.heightAnchor.constraint(equalToConstant: 50),
            buttonMiniPlayer.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -10),
            buttonMiniPlayer.centerYAnchor.constraint(equalTo: popupView.centerYAnchor),

            albumImageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 5),
            albumImageView.topAnchor.constraint(equalTo: popupView.topAnchor,constant: 5),
            albumImageView.bottomAnchor.constraint(equalTo: popupView.bottomAnchor,constant: -5),
            albumImageView.widthAnchor.constraint(equalToConstant: 60), // Регулируйте ширину по вашему желанию
            
            labelSong.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 5),
            labelSong.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 5),
            labelSong.trailingAnchor.constraint(equalTo: popupView.trailingAnchor),
            
            artistNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 5),
            artistNameLabel.topAnchor.constraint(equalTo: labelSong.bottomAnchor, constant: 2),
            artistNameLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor),
            artistNameLabel.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -5),
            
            ])
        
        view.addSubview(popupView)
        
        NSLayoutConstraint.activate([
            popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            popupView.heightAnchor.constraint(equalToConstant: 60) // Регулируйте высоту по вашему желанию
        ])
        
        // Отобразите всплывающее окно без анимации
        self.view.layoutIfNeeded()
    }
    
    
    
    
    
    private func updatePlayPauseButtonImage() {
        // изображение в зависимости от состояния воспроизведения
        let imageName = isPlaying ? "pause" : "play"
        playPauseButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
   

    func updateLabelTime() {
        let currentTimeMinutes = Int(slider.value) / 60
        let currentTimeSeconds = Int(slider.value) % 60
        labelTime.text = String(format: "%02d:%02d", currentTimeMinutes, currentTimeSeconds)
        
        let endTimeMinutes = Int(slider.maximumValue) / 60
        let endTimeSeconds = Int(slider.maximumValue) % 60
        labelEndTime.text = String(format: "-%02d:%02d", endTimeMinutes - currentTimeMinutes, endTimeSeconds - currentTimeSeconds)
    }
    func createDoubleGradientImage() -> UIImage? {
        let width: CGFloat = 800
        let height: CGFloat = 600
        
        // Создаем контекст рисования
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // Определяем цвета градиента
        let topColor = UIColor.systemBlue.cgColor
        let bottomColor = UIColor.blue.withAlphaComponent(0.4).cgColor
        
        // Создаем верхний градиент
        let topGradient = CGGradient(colorsSpace: nil, colors: [topColor, bottomColor] as CFArray, locations: nil)
        
        // Рисуем верхний градиент
        let topStartPoint = CGPoint(x: width/2, y: 0)
        let topEndPoint = CGPoint(x: width/2, y: height/2)
        context.drawLinearGradient(topGradient!, start: topStartPoint, end: topEndPoint, options: [])
        
        // Получаем изображение
        guard let topGradientImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        
        // Сбрасываем контекст
        UIGraphicsEndImageContext()
        
        // Применяем размытие
        if let blurredImage = applyBlur(to: topGradientImage) {
            return blurredImage
        }
        
        // В случае ошибки возвращаем nil
        return nil
    }
    
    func applyBlur(to image: UIImage) -> UIImage? {
        if let ciImage = CIImage(image: image) {
            let blurFilter = CIFilter(name: "CIGaussianBlur")
            blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
            blurFilter?.setValue(20.0, forKey: kCIInputRadiusKey) // Можете изменить радиус размытия по своему усмотрению
            
            if let outputImage = blurFilter?.outputImage {
                let context = CIContext(options: nil)
                if let cgImage = context.createCGImage(outputImage, from: ciImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        
        return nil
    }
    
    
    @objc private func sliderValueChanged() {
        updateLabelTime()
    }
    @objc private func randomButtonTapped() {
        // Изменить цвет кнопки на зеленый, либо вернуть в исходный цвет
        buttonRandom.tintColor = (buttonRandom.tintColor == .green) ? .white : .green
        print("Кнопка 'Random' нажата")
    }
    
    @objc private func playlistButtonTapped() {
        // Изменить цвет кнопки на зеленый, либо вернуть в исходный цвет
        buttonPlaylist.tintColor = (buttonPlaylist.tintColor == .green) ? .white : .green
        print("Кнопка 'Playlist' нажата")
    }
    
    @objc private func shareButtonTapped() {
        // Изменить цвет кнопки на зеленый, либо вернуть в исходный цвет
        buttonShare.tintColor = (buttonShare.tintColor == .green) ? .white : .green
        print("Кнопка 'Share' нажата")
    }
    
    @objc private func bluetoothButtonTapped() {
        // Изменить цвет кнопки на зеленый, либо вернуть в исходный цвет
        buttonBluetooth.tintColor = (buttonBluetooth.tintColor == .green) ? .white : .green
        print("Кнопка 'Bluetooth' нажата")
    }
    
    @objc private func repeatButtonTapped() {
        // Изменить цвет кнопки на зеленый, либо вернуть в исходный цвет
        buttonRepeat.tintColor = (buttonRepeat.tintColor == .green) ? .white : .green
        print("Кнопка 'Repeat' нажата")
    }
}
