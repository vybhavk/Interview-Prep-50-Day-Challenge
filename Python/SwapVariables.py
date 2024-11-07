
"""

Swap the values of two variables without using a third variable.

Constraints
The input variables a and b must be of type int.
There are no specific constraints on the values of a and b. They can be positive, negative, or zero.
"""

def swap_two_variables(input):
    a = input["a"]
    b = input["b"]
    # solution 1
    a,b = b,a 

    # solution 2 

    a = a + b
    b = a - b
    a = a - b

    return a,b 
