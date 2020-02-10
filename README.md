# Workshop, list manipulation in Haskell

### Objective
Reimplement functions from the standard library, more precisely functions to manipulate lists.\
You can use all functions but the one you're implementing (can't use length to implement myLength).\
You will find in src/ files with the functions to implement.\
You can use tests to get a quick description of every function.


### Testing
You can use the 'test.sh' script to run tests to check if your implementation is correct.

This script can be used in 3 ways:
- 0 arguments: Runs all tests
- 1 arguments: Runs a part of the tests corresponding to a level of dificulty
- 2 arguments: Runs tests for a specific function in a level of difficulty

For example:
- ```./test.sh``` will run all tests
- ```./test.sh Basic``` will run tests on basic functions
- ```./test.sh Basic myNull``` will run tests for the myNull function

You're probably going to want to test function by function to begin with as the test output can be pretty obnoxious.


### Notes
Some prototypes have been simplified.\
Error handling is not required.\
You can create other functions if it helps you.
