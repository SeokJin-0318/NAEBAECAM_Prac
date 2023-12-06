class Order
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
        menuInfo.append(MenuList(number: 777, name: "관리자 모드", description: "관리자 모드 진입"))        // 데이터베이스 연결 해야해서 불가
    }
    
    func inputNum() -> Int
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
            
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return 0 }           // 예외처리 추가
            
        return choiceNumber
    }

    
}

/*
if password == 1234
{
    관리자
    모드
    리스트
    추가
    음식 배열 수정 기능 등 메뉴 번호 추가는 .count
}
else
{
    print("비밀번호가 틀렸습니다.")   // 처음 화면으로 돌아가기
}
 */



class Burger: MenuList
{
    var number: Int
    var name: String
    var price: Int
    var description: String
    
    
    static var BurgerList: [Burger] = [
        Burger(number: 999, name: "[ Burgers ]", price: 0, description: "제목"),
        Burger(number: 1, name: "석버거", price: 6900, description: "토마토, 양상추, 석소스가 토핑된 치즈버거"),
        Burger(number: 2, name: "스모크 버거", price: 8900, description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
        Burger(number: 3, name: "치즈 폭탄버거", price: 9400, description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"),
        Burger(number: 4, name: "치즈 버거", price: 6900, description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
        Burger(number: 5, name: "햄버거", price: 5400, description: "비프 패티를 기반으로 야채가 들어간 기본버거"),
        Burger(number: 0, name: "뒤로가기", price: 0, description: "뒤로가기")
    ]
    
    init(number: Int = 0, name: String = "", price: Int = 0 , description: String = "")
    {
        self.number = number
        self.name = name
        self.price = price
        self.description = description
    }
    
    static func printMenu()
    {
        for i in BurgerList
        {
            if i.number == 999 || i.number == 0
            {
                if i.number == 999
                {
                    print(i.name)
                }
                else
                {
                    print("\(i.number). \(i.name)    | \(i.description)")
                }
            }
            else
            {
                print("\(i.number). \(i.name) | ₩ \(i.price) | \(i.description)")
            }
        }
    }
    
    func inputNum() -> Int
    {
        
        let input = readLine()
        
        guard let bind_input = input ,let choiceNumber = Int(bind_input) else { return 0 }           // 예외처리 추가
        
        
        return choiceNumber
        
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
    
    override init()
    {
        desertInfo.append(DesertList(number: 999, name: "[ Deserts ]", price: 0, description: "제목"))
        desertInfo.append(DesertList(number: 1, name: "소프트콘", price: 3500, description: "신선한 우유를 사용한 소프트콘"))
        desertInfo.append(DesertList(number: 2, name: "츄러스", price: 3000, description: "바삭함과 시나몬향이 일품인 츄러스"))
        desertInfo.append(DesertList(number: 3, name: "스모어", price: 4000, description: "누텔라와 마시멜로를 녹여 비스킷 사이에 끼워둔 악마의 디저트!!"))
        desertInfo.append(DesertList(number: 0, name: "뒤로가기", price: 0, description: "뒤로가기"))
    }
    
    override func inputNum() -> Int
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
        
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return 0 }
        
        
        return choiceNumber
    }
}

class Drink: Order
{
    struct DrinkList
    {
        var number: Int
        var name: String
        var price: Int
        var description: String
    }
    
    var drinktInfo: [DrinkList] = []
    
    override init()
    {
        drinktInfo.append(DrinkList(number: 999, name: "[ 음료 및 맥주 ]", price: 0, description: "제목"))
        drinktInfo.append(DrinkList(number: 1, name: "콜라", price: 2000, description: "시원한 콜라"))
        drinktInfo.append(DrinkList(number: 2, name: "콜라 제로", price: 2000, description: "자책감을 덜어주는 칼로리 '0' 콜라"))
        drinktInfo.append(DrinkList(number: 3, name: "라거", price: 4000, description: "가볍고 강한 탄산감이 특징인 맥주!"))
        drinktInfo.append(DrinkList(number: 4, name: "에일", price: 4000, description: "향이 풍부하고 바디감이 느껴지는 맥주!"))
        drinktInfo.append(DrinkList(number: 5, name: "흑맥주", price: 5000, description: "거품이 풍부하고 씁쓸한 맛이 특징인 맥주!"))
        drinktInfo.append(DrinkList(number: 0, name: "뒤로가기", price: 0, description: "뒤로가기"))
    }
    
    override func inputNum() -> Int
    {
        //for i in 배열
        
        for i in drinktInfo
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
        
        guard let bind_input = input, let choiceNumber = Int(bind_input) else { return 0 }
        
        
        return choiceNumber
    }
}
