import UIKit

class AbstractOperation
{
    func rcalculate(num1: Double, num2: Double) -> Double
    {
        return 0
    }
}

class AddOperation: AbstractOperation
{
    override func rcalculate(num1: Double, num2: Double) -> Double
    {
        return num1 + num2
    }
}

class SubtractOperation: AbstractOperation
{
    override func rcalculate(num1: Double, num2: Double) -> Double
    {
        return num1 - num2
    }
}

class MultiplyOperation: AbstractOperation
{
    override func rcalculate(num1: Double, num2: Double) -> Double
    {
        return num1 * num2
    }
}

class DivideOperation: AbstractOperation
{
    override func rcalculate(num1: Double, num2: Double) -> Double
    {
        return num1 / num2
    }
}


class Calculator
{
    var operation : AbstractOperation
    
    init(inputOperation: AbstractOperation)
    {
        self.operation = inputOperation
    }
    
    func setOperation(inputOperation: AbstractOperation)
    {
         operation = inputOperation
    }
    
    func calculate(inputNum1: Double, inputNum2: Double) -> Double
    {
        return operation.rcalculate(num1: inputNum1, num2: inputNum2)
    }
}

let calculation = Calculator(inputOperation: AddOperation())

let addResult = calculation.calculate(inputNum1: 1, inputNum2: 1)

calculation.setOperation(inputOperation: SubtractOperation())
let subtractResult = calculation.calculate(inputNum1: 1, inputNum2: 1)

calculation.setOperation(inputOperation: MultiplyOperation())
let multiplyResult = calculation.calculate(inputNum1: 1, inputNum2: 1)

calculation.setOperation(inputOperation: DivideOperation())
let divideResult = calculation.calculate(inputNum1: 1, inputNum2: 1)

    
print("\(addResult)")
print("\(subtractResult)")
print("\(multiplyResult)")
print("\(divideResult)")





