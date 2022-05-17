# api_mock_stub

Clone this repo if you'd like to follow along on the following testing exercises:
1. mock and stub ruby testing
2. mock and stub api testing

# setup
  mocks, stubs, and doubles come with rspec. Bundle to install 'httparty' that we'll need for an API service call.

# to check rate limit-use the following line
```
curl -I https://api.github.com/users/USERNAME
```
replace USERNAME with your github username

# Lesson on Mocks and Stubs
https://backend.turing.edu/module1/lessons/mocks_stubs

# Terminologies:

## Doubles

In this scope, also known as Test Double. Test Double is a generic term for any case where you replace a production object for testing purposes. There are various kinds of double that Gerard lists:

Dummy objects are passed around but never actually used. Usually they are just used to fill parameter lists.
Fake objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an InMemoryTestDatabase is a good example).
#### Stubs provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.
Spies are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent.
#### Mocks are pre-programmed with expectations which form a specification of the calls they are expected to receive. They can throw an exception if they receive a call they don't expect and are checked during verification to ensure they got all the calls they were expecting.

Doubles can be set up as different type based on the desired testing outcomes (e.g. instance_double, class_double, object_double, etc.). We will only use two types of doubles to create mocks today:

`double_mock = double('anything or blank')` (class  `RSpec::Mocks::Double`)
`instance_mock = instance_double(Class, method1: val1, method2: val2...`)(class `RSpec::Mocks::InstanceVerifyingDouble`)

Different types of doubles: https://relishapp.com/rspec/rspec-mocks/v/3-11/docs/verifying-doubles

## Mocks

Mocks are objects that stand in for other objects. The other object might be one that’s not implemented yet, doesn’t yet have the functionality we need, or maybe we just want to work with a simpler situation. You can think of a mock as fake or a dummy object. 
Mocks can be setup as different categories of doubles(we will show double and instance_double in this demo) (Think of categories of doubles as different vihecle types).

## Stubs

Stubs are used to test methods that could potentially have multiple outcomes, for example, something like a number or password generator. Hard coding test values in these scenarios would no doubt have undesirable outcomes, lets give an example in RSpec as illustrated in the video below.

Source: https://stevenklavins94.medium.com/rspec-mocks-stubs-let-doubles-98f9b6000f92
