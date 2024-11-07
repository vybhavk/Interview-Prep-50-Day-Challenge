"""
Given an array, write a function that returns the sorted squares its elements.

Constraints
The input array arr is a list of integers.
The length of the input array arr is not specified, but it should be a non-negative integer.
The elements of the input array arr can be positive, negative, or zero.
The input array arr may contain duplicate elements.
The input array arr may be empty.

"""

def sorted_squares(arr):
    """ 
    :type arr: List[int]
    :rtype: List[int]
    """
    
    """
     get all the squares of the numbers 
     sort them`
     return 
    """
    arr_sq = [s**2 for s in arr]
    return sorted(arr_sq)
