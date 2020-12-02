import Foundation
import ArgumentParser
import AOCKit

struct DayOne: ParsableCommand {
	
	@Argument(help: "input")
	var input: String

	mutating func run() throws {
		let inputNumbers = input.components(separatedBy: "\n").map { Int($0)! }
		let inputCombinations2 = AOCKit.permutationsWithoutRepetitionFrom(inputNumbers, taking: 2)
		let inputCombinations3 = AOCKit.permutationsWithoutRepetitionFrom(inputNumbers, taking: 3)

		for i in 0 ..< inputCombinations2.count {
			let combo = inputCombinations2[i]
			print("trying combo \(combo)")
			let sum = combo.reduce(0, +)
			if sum == 2020 {
				print("\(combo) = 2020")
				break
			}
		}

		for i in 0 ..< inputCombinations3.count {
			let combo = inputCombinations3[i]
			print("trying combo \(combo)")
			let sum = combo.reduce(0, +)
			if sum == 2020 {
				print("\(combo) = 2020")
				break
			}
		}

	}

}

func readSTDIN () -> String? {
	var input: String?

	while let line = readLine() {
		if input == nil {
			input = line
		} else {
			input! += "\n" + line
		}
	}	

	return input
}

var text: String?
if CommandLine.arguments.count == 1 || CommandLine.arguments.last == "-" {
	if CommandLine.arguments.last == "-" { CommandLine.arguments.removeLast() }
	text = readSTDIN()
}

var arguments = Array(CommandLine.arguments.dropFirst())
if let text = text {
	arguments.insert(text, at: 0)
}

var command = DayOne.parseOrExit(arguments)
do {
	try command.run()
} catch {
	DayOne.exit(withError: error)
}



