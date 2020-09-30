//
//  UseCase.swift
//  RxSideDish
//
//  Created by Delma Song on 2020/09/21.
//  Copyright © 2020 Delma Song. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UseCaseProvider {
    private static let instance: UseCaseProvider = UseCaseProvider()
    private let useCase: UseCase = UseCaseImpl()
    
    static func getUseCase() -> UseCase {
        return instance.useCase
    }
}

protocol UseCase: class {
    func fetchMenuDetail(ID: String) -> Observable<MenuDetail?>
    func fetchMenuList(type: EndPoints) -> Observable<[Menu]>
    func fetchMenu(type: EndPoints, ID: String) -> Observable<Menu?>
}

final class UseCaseImpl: UseCase {
    let apiService = APIService()
    
    func fetchMenuDetail(ID: String) -> Observable<MenuDetail?> {
        let url = "\(EndPoints.DetailURL)\(ID)"
        return apiService.fetch(url: url)
            .map { data -> MenuDetail? in
                var detailMenu: MenuDetail?
                do {
                    let decodedData = try JSONDecoder().decode(MenuDetailContainer.self, from: data)
                    detailMenu = decodedData.data
                } catch {
                    print(error)
                }
                return detailMenu
            }
    }
    
    func fetchMenuList(type: EndPoints) -> Observable<[Menu]> {
        let url = "\(EndPoints.BaseURL)\(type.rawValue)"
        return apiService.fetch(url: url)
            .map { data -> [Menu] in
                var list = [Menu]()
                do {
                    let decodedData = try JSONDecoder().decode(MenuContainer.self, from: data)
                    list = decodedData.data
                } catch {
                    print(error)
                }
                return list
            }
    }
    
    func fetchMenu(type: EndPoints, ID: String) -> Observable<Menu?> {
        let url = "\(EndPoints.BaseURL)\(type.rawValue)/\(ID)"
        return apiService.fetch(url: url)
            .map { data -> Menu? in
                var menu: Menu?
                do {
                    let decodedData = try JSONDecoder().decode(Menu.self, from: data)
                    menu = decodedData
                } catch {
                    print(error)
                }
                return menu
            }
    }
}
