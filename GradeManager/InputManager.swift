//
//  InputManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/30.
//

import Foundation

struct IOManager {
    
    let menuInputPrompt = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let invalidMenuInputPrompt = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let closeProgramPrompt = "프로그램을 종료합니다..."
    let addStudentPrompt = "추가할 학생의 이름을 입력해주세요"
    let removeStudentPrompt = "삭제할 학생의 이름을 입력해주세요"
    let invalidInputPrompt = "입력이 잘못되었습니다. 다시 확인해주세요."
    let addGradePrompt = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    let removeGradePromt = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요."
    let lookupGradePrompt = "평점을 알고싶은 학생의 이름을 입력해주세요."
    
    func menuInput() throws -> String {
        print(menuInputPrompt)
        
        let receivedInput = readLine()
        guard let receivedInput = receivedInput else {
            throw InputError.invalidMenuInput
        }
        
        return receivedInput
    }
    
    func addStudentInput() throws -> String {
        print(addStudentPrompt)
        let receivedInput = readLine()
        
        let regexExpression = "^[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func removeStudentInput() throws -> String {
        print(removeStudentPrompt)

        let receivedInput = readLine()
        
        let regexExpression = "^[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func addOrModifyGradeInput() throws -> (String, String, String) {
        print(addGradePrompt)
        
        let receivedInput = readLine()
        
        let regexExpression = "[a-zA-Z0-9]+\\s[a-zA-Z0-9]+\\s([A, B, C, D]+[0, +]|[F])"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        let inputComponents = receivedInput.split(separator: " ").map{ String($0) }
        
        return (inputComponents[0], inputComponents[1], inputComponents[2])
    }
    
    func removeGradeInput() throws -> (String, String) {
        print(removeGradePromt)
        
        let receivedInput = readLine()
        
        let regexExpression = "[a-zA-Z0-9]+\\s[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        let inputComponents = receivedInput.split(separator: " ").map{ String($0) }
        
        return (inputComponents[0], inputComponents[1])
    }
    
    func lookupGradeInput() throws -> String {
        print(lookupGradePrompt)
        let receivedInput = readLine()
        
        let regexExpression = "^[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func printInvalidMenuInput() {
        print(invalidMenuInputPrompt)
    }
    
    func printCloseProgram() {
        print(closeProgramPrompt)
    }
}
