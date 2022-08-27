//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by Amin  Bagheri  on 2022-08-25.
//

import UIKit

class HomeViewController: UIViewController {

    private let timeLineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeLineTableView)
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
        configureNavigationBar()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLineTableView.frame = view.frame
    }
    
    private func configureNavigationBar() {
        // Created the logo for the nav bar
        let logoSize: Int = 36
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: logoSize, height: logoSize))
        logoImageView.contentMode = .scaleAspectFit // fit the photo keeping aspect ratio
        logoImageView.image = UIImage(named: "twitterLogo")
        // add the logo to a placeholder view
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: logoSize, height: logoSize))
        middleView.addSubview(logoImageView)
        // set the title item for the the naviagtion bar to be equal to that view
        navigationItem.titleView = middleView
        // adding a profile image to be the left bar button item as well.
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfile))
    }
    
    @objc private func didTapProfile() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        // This is the final step of implementing the protocol. This cell is now the intern of the protocol.
        cell.delegate = self
        return cell
    }
}

// The 'intern' now has access to any of the data that gets sent from the tweet table view cell.
extension HomeViewController: TweetTableViewCellDelegate {
    func tweetTableViewCellDidTapReply() {
        print("Did tapped reply")
    }
    
    func tweetTableViewCellDidTapRetweet() {
        print("Retweet")
    }
    
    func tweetTableViewCellDidTapLike() {
        print("Like")

    }
    
    func tweetTableViewCellDidTapShare() {
        print("Share")

    }
    
    
}
