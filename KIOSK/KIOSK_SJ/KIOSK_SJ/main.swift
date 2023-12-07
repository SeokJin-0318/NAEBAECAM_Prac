//
//  main.swift
//  키오스크 주문 프로그램
//
//  Created by 석진 on 12/4/23.
//

import Foundation


protocol KIOSK      // 키오스크 프로토콜 정의
{
    func displayMainMenu()
}

class MainMenu
{
    struct MenuList
    {
        var number: Int
        var name: String
        var description: String
    }
    
    var menuInfo: [MenuList] = []
    
    init()
    {
        menuInfo.append(MenuList(number: 999, name: "[ 석버거 메뉴 카테고리 ]", description: "제목"))
        menuInfo.append(MenuList(number: 1, name: "Burger", description: "숙성시킨 한우을 다져 만든 버거"))
        menuInfo.append(MenuList(number: 2, name: "Desert", description: "매장에서 직접 만드는 디저트"))
        menuInfo.append(MenuList(number: 3, name: "Drinks", description: "음료 및 맥주"))
        menuInfo.append(MenuList(number: 0, name: "종료", description: "프로그램 종료"))
      //menuInfo.append(MenuList(number: 777, name: "관리자 모드", description: "관리자 모드 진입"))        // 데이터베이스 연결 해야해서 불가
    }
    
    func inputNum()
    {
        for i in menuInfo
        {
            if i.number == 999
            {
               print(i.name)
            }
            else
            {
                print("\(i.number). \(i.name) | \(i.description)")
            }
        }
        
        let input = readLine()
        
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return print("올바른 번호를 입력하세요") }           // 예외처리 추가
        
        switch choiceNumber
        {
        case 2: Desert().inputNum()
        case 0: break
        default:
            print("올바른 번호를 입력하세요")
        }
    }
    
}

class Desert
{
    struct DesertList
    {
        var number: Int
        var name: String
        var price: Int
        var description: String
    }
    
    var desertInfo: [DesertList] = []
    
    let goCart: ShowCart
    var goCartItem: [DesertList] = []
    
    init()
    {
        desertInfo.append(DesertList(number: 999, name: "[ Deserts ]", price: 0, description: "제목"))
        desertInfo.append(DesertList(number: 1, name: "소프트콘", price: 3500, description: "신선한 우유를 사용한 소프트콘"))
        desertInfo.append(DesertList(number: 2, name: "츄러스", price: 3000, description: "바삭함과 시나몬향이 일품인 츄러스"))
        desertInfo.append(DesertList(number: 3, name: "스모어", price: 4000, description: "누텔라와 마시멜로를 녹여 비스킷 사이에 끼워둔 악마의 디저트!!"))
        desertInfo.append(DesertList(number: 0, name: "뒤로가기", price: 0, description: "뒤로가기"))
        
        goCart = ShowCart()
    }
    
    func inputNum() -> [Any]
    {
        //for i in 배열
        
        for i in desertInfo
        {
            if i.number == 999 || i.number == 0
            {
                if i.number == 999
                {
                    print(i.name)
                }
                else
                {
                    print("\(i.number). \(i.name) | \(i.description)")
                }
            }
            else
            {
                print("\(i.number). \(i.name) | ₩ \(i.price) | \(i.description)")
            }
        }
        
        let input = readLine()
        
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return [] }
        
        switch choiceNumber
        {
            case 1: goCartItem = [desertInfo[1]]
            case 2: goCartItem = [desertInfo[2]]
            case 3: goCartItem = [desertInfo[3]]
            case 0: return []
            default:
                print("올바른 번호를 입력하세요")
        }
        
        
        return goCart.check(food: goCartItem[0].name, cost: goCartItem[0].price, info: goCartItem[0].description)
    }
}

class ShowCart
{
    let goBack = MainMenu()
    
    func check(food: String, cost: Int, info: String) -> [Any]
    {
        print("\(food) | ₩ \(cost) | \(info)")
        print("위 메뉴를 장바구니에 추가하시겠습니까?")
        print("1. 확인        2. 취소")
        
        let input = readLine()
        
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return [] }
        
        if choiceNumber == 1
        {
            print("\(food) 가 장바구니에 추가되었습니다.")
            return [food, cost]
        }
        
        else if choiceNumber == 2
        {
            goBack.inputNum()
        }
        
        else
        {
            print("올바른 번호를 입력하세요.")
        }
        return[]
    }
}


class calculateCart
{
    var totalCost: Int = 0
    
    func fixTotalCost(cost: Int) -> Int
    {
        totalCost += cost
        
        return totalCost
    }
}


let mainMenu: MainMenu = MainMenu()
let desertMenu: Desert = Desert()
let calculate = calculateCart()
var foodPrice: [Any] = []
var keepOrder: Bool = true

var totalCost: Int = 0

while keepOrder == true
{
    mainMenu = mainMenu.inputNum()
    foodPrice = desertMenu.inputNum()
    totalCost = calculate.fixTotalCost(cost: foodPrice[1] as! Int)      //
    print("장바구니에 담긴 금액 : \(totalCost)")
}
