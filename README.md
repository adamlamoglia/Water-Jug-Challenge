# Water Jug Challenge

Welcome to the Water Jug Challenge App! This application is designed to solve the classic Water Jug Riddle. The challenge consists utilizing two jugs with distinct capacities (X gallons and Y gallons) to measure precisely Z gallons of water. Our user-friendly interface dynamically showcases the state changes of each jug, indicating whether it's Empty, Full, or Partially Full as the solution unfolds.

## Table of Contents

- [Algorithmic Approach](#algorithmic-approach)
- [Test Cases for Validation](#test-cases-for-validation)
- [Instructions](#instructions)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

## Algorithmic Approach

The problem is modeled as a Diophantine equation of the form mx + ny = z, where x and y are the capacities of the jugs, m and n are the number of times each jug is filled, and z is the desired amount of water. The solution is then found by applying the Extended Euclidean Algorithm to find the greatest common divisor of x and y. The algorithm returns the coefficients of the equation, which are then used to determine the number of times each jug is filled.

## Test Cases for Validation

This sections lists several test cases that you can use to validate the correctness of your solution. Feel free to add more test cases as needed.

- **Test Case 1:**

    - Bucket X: 2
    - Bucket Y: 10
    - Amount wanted Z: 4
    - Result: 4 steps
    
    | Step | Jug X | Jug Y | Action                   |
    |------|-------|-------|--------------------------|
    | 1    | 2     | 0     | Fill Jug X               |
    | 2    | 0     | 2     | Transfer from X to Y     |
    | 3    | 2     | 2     | Fill Jug X               |
    | 4    | 0     | 4     | Transfer from X to Y     |

- **Test Case 2:**

    - Bucket X: 2
    - Bucket Y: 100
    - Amount wanted Z: 96
    - Result: 4 steps

    | Step | Jug X | Jug Y | Action                   |
    |------|-------|-------|--------------------------|
    | 1    | 0     | 100   | Fill Jug Y               |
    | 2    | 2     | 98    | Transfer Y to X          |
    | 3    | 0     | 98    | Empty X                  |
    | 4    | 2     | 96    | Transfer Y to X          |

- **Test Case 3:**

    - Bucket X: 2
    - Bucket Y: 6
    - Amount wanted Z: 5
    - Result: No solution

- **Test Case 4:**

    - Bucket X: 3
    - Bucket Y: 12
    - Amount wanted Z: 6
    - Result: 4 steps

    | Step | Jug X | Jug Y | Action         |
    |------|-------|-------|----------------|
    | 1    | 0     | 12    | Fill Jug Y     |
    | 2    | 3     | 9     | Transfer Y to X|
    | 3    | 0     | 9     | Empty X        |
    | 4    | 3     | 6     | Transfer Y to X|

- **Test Case 5:**

    - Bucket X: 4
    - Bucket Y: 9
    - Amount wanted Z: 7
    - Result: 10 steps

    | Step | Jug X | Jug Y | Action         |
    |------|-------|-------|----------------|
    | 1    | 4     | 0     | Fill Jug X     |
    | 2    | 0     | 4     | Transfer X to Y|
    | 3    | 4     | 4     | Fill Jug X     |
    | 4    | 0     | 8     | Transfer X to Y|
    | 5    | 4     | 8     | Fill Jug X     |
    | 6    | 3     | 9     | Transfer X to Y|
    | 7    | 3     | 0     | Empty Jug Y    |
    | 8    | 0     | 3     | Transfer X to Y|
    | 9    | 4     | 3     | Fill Jug X     |
    | 10   | 0     | 7     | Transfer X to Y|

- **Test Case 6:**

    - Bucket X: 2
    - Bucket Y: 6
    - Amount wanted Z: 8
    - Result: No solution

- **Test Case 7:**

    - Bucket X: 3
    - Bucket Y: 5
    - Amount wanted Z: 4
    - Result: 6 steps

    | Step | Jug X | Jug Y | Action         |
    |------|-------|-------|----------------|
    | 1    | 0     | 5     | Fill Jug Y     |
    | 2    | 3     | 2     | Transfer Y to X|
    | 3    | 0     | 2     | Empty Jug X    |
    | 4    | 2     | 0     | Transfer Y to X|
    | 5    | 2     | 5     | Fill Jug Y     |
    | 6    | 3     | 4     | Transfer Y to X|

## Instructions

To run the program, follow these steps:

1. Clone this repository:

```bash
git clone https://github.com/adamlamoglia/Water-Jug-Challenge.git

2. Navigate to the project directory:

```bash
cd Water-Jug-Challenge

3. Run the program:

```bash
 flutter run
