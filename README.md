# Swift Concepts
Code written while learning the Swift programming language. I use tests to organize and execute the code.

## Create Testing Target in Xcode
- This is necessary to run unit tests
- If creating a new project, just check "Include Tests" checkbox.
- To add to an existing project: File > New > Target. In pop-up, select iOS, search for "test" and select "Unit Testing Bundle", accept defaults and click Finish.
- To create a new test case file, New > File and select "Unit Test Case Class", in next window give the test class a name and accept other defaults. In next screen, make sure Target is your test target, not the app target.

## Running tests
- Click diamond by line numbers in editor to run a specific test or all tests in class
- On the Navigator side bar on left, the 6th tab on top is the Test Navigator where you can kick off tests
- Product > Test (or Cmd+U) runs entire test suite including UI tests.
