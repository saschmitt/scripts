#!/usr/bin/python3.2
def fib(n): # write Fibonacci series up to n
	"""Print a Fibonacci series up to n."""
	a, b = 0, 1
	while b < n:
		print(b, end=' ')
		a, b = b, a+b
	print()

#####

if x < 0:
	x = 0
	print('Negative changed to zero')
elif x == 0:
	print('Zero')
elif x == 1:
	print('Single')
else:
	print('More')
#####
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
    while True:
        ok = input(prompt)
        if ok in ('y', 'ye', 'yes'): return True
        if ok in ('n', 'no', 'nop', 'nope'): return False
        retries = retries - 1
        if retries < 0:
            raise IOError('refusenik user')
        print(complaint)



#!/usr/bin/python3.2
import subprocess
test = input('Essais ')
print(test)
subprocess.call(['echo', test])



