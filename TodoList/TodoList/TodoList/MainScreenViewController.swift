//
//  ViewController.swift
//  TodoList
//
//  Created by 석진 on 1/9/24.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let imageURLString = "https://spartacodingclub.kr/css/images/scc-og.jpg"
        
        if let imageURL = URL(string: imageURLString)
        {
            // 비동기적으로 이미지를 다운로드합니다.
            URLSession.shared.dataTask(with: imageURL)
            { (data, response, error) in
                // 에러 체크
                if let error = error
                {
                    print("Error downloading image: \(error)")
                    return
                }
                
                // 데이터가 있으면 UIImage를 만들어서 이미지 뷰에 할당
                if let data = data, let image = UIImage(data: data)
                {
                    DispatchQueue.main.async
                    {
                        self.mainImage.image = image
                    }
                }
            }.resume()
        }
    }

}

