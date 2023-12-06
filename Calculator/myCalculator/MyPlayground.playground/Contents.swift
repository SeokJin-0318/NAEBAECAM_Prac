
import UIKit

class AbstractOperation
{
    func calculate(fNum: Double, sNum: Double) -> Double
    {
        return 0
    }
}

class add: AbstractOperation
{
    override func calculate(fNum: Double, sNum: Double) -> Double
    {
        return fNum + sNum
    }
}

class minus: AbstractOperation
{
    override func calculate(fNum: Double, sNum: Double) -> Double
    {
        return fNum - sNum
    }
}

class multi: AbstractOperation
{
    override func calculate(fNum: Double, sNum: Double) -> Double
    {
        return fNum * sNum
    }
}

class divide: AbstractOperation
{
    override func calculate(fNum: Double, sNum: Double) -> Double
    {
        if sNum == 0
        {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        
        return fNum / sNum
    }
}


class Calculator
{
    var operation: AbstractOperation        // 함수 호출?
    
    init(operate: AbstractOperation)
    {
        self.operation = operate
    }
    
    func setOperation(setOperate: AbstractOperation)    //연산 클래스를 정하기 위한 메소드
    {
        self.operation = setOperate
    }
    
    func calculate(num1: Double, num2: Double) -> Double        //실제 계산 메소드,  사용자가 입력한 num1, num2
    {
        return operation.calculate(fNum: num1, sNum: num2)      // 각 연산 클래스의 변수 fNum, sNum에 전달
    }
}

let calculator: Calculator = Calculator(operate: add())

let addResult = calculator.calculate(num1: 1, num2: 2)
let addResult2 = calculator.calculate(num1: 4, num2: 8)

calculator.setOperation(setOperate: minus())
let minusResult = calculator.calculate(num1: 3, num2: 4)

calculator.setOperation(setOperate: multi())
let multiResult = calculator.calculate(num1: 5, num2: 6)

calculator.setOperation(setOperate: divide())
let divideResult = String(format: "%.2f", calculator.calculate(num1: 7, num2: 8))


print("덧셈 결과는 \(addResult) 입니다.")
print("뺄셈 결과는 \(minusResult) 입니다.")
print("곱셈 결과는 \(multiResult) 입니다.")
print("나눗셈 결과는 \(divideResult) 입니다.")

let add1 = add()
let minus1 = minus()
let array = [add1, minus1]
