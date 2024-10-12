"""
Given an integer N, write a function that returns a list of all of the prime numbers up to N.

Note: Return an empty list there are no prime numbers less than or equal to N.

Example:

Input:

N = 3
Output:

def prime_numbers(N) -> [2,3]
"""


def prime_numbers(N):
    prime = []
    if N < 2:
        return prime
    for i in range(1, N+1):
        remaining = [i%j==0 for j in range(1, i+1)]
        if sum(remaining) == 2:
            prime.append(i)
    return prime
