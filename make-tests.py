import sys
import random

if (len(sys.argv) < 3):
    print('Usage: make-tests.py <array_length> <output_file>')
    exit()
n = int(sys.argv[1])
with open(sys.argv[2], 'wt') as f:
    f.write(f"{n}\n")
    for i in range(n):
        k = random.randint(-30, 30)
        f.write(f'{k}\n')