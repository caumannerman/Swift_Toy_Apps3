//
//  FeedViewController.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/04.
//

import UIKit
import SnapKit


class FeedViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        //cell 등록
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        
        return imagePickerController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setupNavigationBar()
        setupTableView()
    }
}

extension FeedViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        
        //여기서는 cell이 클릭되면 안되므로!
        cell.selectionStyle = .none
        cell.setup()
        
        return cell
    }
    
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?
        
        //info가 선택된 이미지에 대한 정보를 갖고있는 딕셔너리
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectImage = editedImage
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectImage = originImage
        }
        
        print(selectImage)
        picker.dismiss(animated:  true) { [weak self] in
            let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}

private extension FeedViewController{
    
    func setupNavigationBar(){
        
        navigationItem.title = "InstagRAM"
        
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton))
        
        navigationItem.rightBarButtonItem = uploadButton
        
    }
    
    @objc func didTapUploadButton(){
        present(imagePickerController, animated: true)
    }
    func setupTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview()}
    }
}
