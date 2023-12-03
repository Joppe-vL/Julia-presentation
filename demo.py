import time

def mandelbrot(a, max_iter=1000):
    z = 0
    for i in range(max_iter):
        # Separate complex exponentiation into real and imaginary parts
        next_z_real = z.real**2 - z.imag**2 + a.real
        next_z_imag = 2 * z.real * z.imag + a.imag

        # Check for overflow and adjust if necessary
        if abs(next_z_real) > 1e100 or abs(next_z_imag) > 1e100:
            break

        z = next_z_real + 1j * next_z_imag

    return z

# Measure compilation time
start_time = time.time()

for y in reversed(range(40)):
    for x in range(-200, 16, 2):
        result = mandelbrot(complex(x * 0.015, y * 0.02))
        print("*" if abs(result) < 2 else " ", end="")
    print()

end_time = time.time()
print(f"Execution time: {end_time - start_time} seconds")
