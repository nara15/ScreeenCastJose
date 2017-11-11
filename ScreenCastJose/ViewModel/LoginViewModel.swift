//
//  UserViewModel.swift
//  ScreenCastJose
//
//  Created by Mario Naranjo Leiva on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel
{
    private var user = MUser()
    lazy var updatedContentSignal = PublishSubject<Any?>()
    let disposeBag = DisposeBag()
    
    init() {
    }
    
    func getCode()->Int{
        return user.code
    }
    
    func login(username:String, password:String)
    {
        //  Webservice call
        let loginRequest = ScreenCastAPI.login(username, password)
        
        moyaProvider.rx.request(loginRequest).mapObject(MUser.self).subscribe { [weak self] event in
            
            if let strongSelf = self {
                switch event {
                case .success(let response):
                    strongSelf.user = response
                    strongSelf.updatedContentSignal.onNext(nil)
                    break
                // do something with the data
                case .error(let error):
                    print(error)
                    break
                }
            }
            
            }.disposed(by: disposeBag)
    }
    
    
    
    
}
