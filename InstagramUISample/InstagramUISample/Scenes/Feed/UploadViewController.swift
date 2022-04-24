//
//  UploadViewController.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/05.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController{
    
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        //placeholder 처럼 구현 - textField 쓰면 되지만, 한 줄로 밖에 입력이 안됨
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self 
        
        return textView
    }()
    
    init(uploadImage: UIImage){
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
        
        imageView.image = uploadImage
        
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        // 기본 문구가 써져있고, 수정을 시작할 때만 아래의 코드가 실행되도록
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}


private extension UploadViewController {
    func setupNavigationItem(){
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
        
        
    }
    
    @objc func didTapLeftButton(){
        dismiss(animated: true)
    }
    
    @objc func didTapRightButton(){
        // TODO: 저장하기
        dismiss(animated: true)
    }
    
    func setupLayout(){
        [imageView, textView].forEach { view.addSubview($0)}
        
        //let text: String = ""
        //관리를 위해 변수 설정 해놓음
        let imageViewInset: CGFloat = 16.0
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}
