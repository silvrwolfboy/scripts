#!/usr/bin/env python3

# Check occurences of a day in a single year.
# For example, we got 11 occurences of day 29 in year 1995.

import datetime
import sys

def main():
    try:
        if int(sys.argv[1]):
            day_occurences = []
    except (IndexError, ValueError) as e:
        print("Error: you need to insert integer value that represents day to be checked as an argument.\nException: {}".format(e))

if __name__ == '__main__':
    main()

