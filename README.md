# api_mock_stub

please clone down this repo if you'd like to follow along on the following topic
1. mock and stub ruby testing
2. mock and stub api testing

# to check rate limit-use the following line
```
curl -I https://api.github.com/users/USERNAME
```
replace USERNAME with your github username

# Lesson on Mocks and Stubs
https://backend.turing.edu/module1/lessons/mocks_stubs

# Terminologies:

## Doubles

You may commonly hear people refer to doubles when unit testing and this can be somewhat misleading as a mock is a type of double, a fake or dummy is a type of double, a stub is a double. A double is quite simply a generic term for these kinds of tests, not a particular thing in itself.

## Mocks

When using mocks we are testing expected behavior of a program and appropriately for these kinds of tests we use the keyword “expect”. For example, say we are expecting a class to contain a particular method, we could write;

expect(subject).to respond_to (:our_method_name)

As you can see RSpec tests are written pretty close to plain old English, we expect subject (our class) to respond to our method (:our_method_name).

## Stubs

Stubs are used to test methods that could potentially have multiple outcomes, for example, something like a number or password generator. Hard coding test values in these scenarios would no doubt have undesirable outcomes, lets give an example in RSpec as illustrated in the video below.

Source: https://stevenklavins94.medium.com/rspec-mocks-stubs-let-doubles-98f9b6000f92
