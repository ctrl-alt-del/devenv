Cheatsheet for Unit Testing
===========================

### Definition
Unit testing is to execute the functionalities in codes to be tested.
`The percentage of code tested in a project = test coverage of the project`

### Goal
To ensure code work as intended or it is still working as intended after making changes

### Text fixture
Fixed state of code under the test, which is used as the baseline of testing

### Integration Test (Functional Test)
To test the behavior of a component or the integration between set of components

### Performance Test
To benchmark software components in a repeated way

### Behavior Test (Interaction Test)
To check if methods are called with correct input parameters, but do NOT validate the result of the methods

### State Test
To validate the result of the methods; state test is mostly used in testing algorithms and system functionalities

### Rule of Selecting Test Targets
* ignore trivial ones, getters and setters
* focus on critical and complex part of the code
* start with the part that report most of the errors

### Conventions
* Put test classes in separate package
* add “Test” as suffix to the name of testing class, e.g. the test class for HelloWorld would be HelloWorldTest
* use “should” in the test method name to better describe what the test should do

Most test framework uses assertion to perform test, such as Assetion(expected_value, given_value)

Test should be written in a way that it can be executed in an arbitrary order, it should not assume any order and test should not depended on other tests

Unit testing also makes use of object mocking, meaning that the real object is exchanged by a replacement which has the predefined behavior for the test; frameworks, such as Mockito and EasyMock can do it
