import Foundation
//  Created by Alexander Matheson
//  Created on 2023-Apr-04
//  Version 1.0
//  Copyright (c) 2023 Alexander Matheson. All rights reserved.
//
//  This program finds the max run of lines in a file.

// This function finds the max run for each line.
func findMaxRun(line: String) -> Int {
  // Declare variables and arrays for function.
  var currentRun = 1
  var maxRun = 0

  // Check if line holds less than two characters.
  if line.count == 1 {
    maxRun = 1
  } else if line.count == 0 {
    maxRun = 0
  } else {
    // Iterate through line and check if current character is equivalent
    // to the next one in the line.
    for counter in 0..<line.count-1 {
      if line[line.index(line.startIndex, offsetBy: counter)] == line[line.index(line.startIndex, offsetBy: counter + 1)] {
        currentRun = currentRun + 1
      } else {
        currentRun = 1
      }

      // Check if current run is greater than max run
      if currentRun > maxRun {
        maxRun = currentRun
      }
    }
  }
  return maxRun
}

// Read in lines from input.txt.
let inputFile = URL(fileURLWithPath: "input.txt")
let inputData = try String(contentsOf: inputFile)
let lineArray = inputData.components(separatedBy: .newlines)

// Open the output file for writing.
let outputFile = URL(fileURLWithPath: "output.txt")

// Call function to find run and print to output file.
var runString = ""
for position in lineArray {
  let run = findMaxRun(line: position)
  print(run)

  // Write results to output 
  runString = runString + "\(run)\n"
  try runString.write(to: outputFile, atomically: true, encoding: .utf8)
}
