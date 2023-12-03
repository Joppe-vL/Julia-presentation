using Plots

function mandelbrot(a, max_iter=1000)
    z = 0.0 + 0.0im  # Initialize z as a complex number
    for i in 1:max_iter
        # Separate complex exponentiation into real and imaginary parts
        next_z_real = real(z)^2 - imag(z)^2 + real(a)
        next_z_imag = 2 * real(z) * imag(z) + imag(a)

        # Check for overflow and adjust if necessary
        if abs(next_z_real) > 1e100 || abs(next_z_imag) > 1e100
            break
        end

        z = next_z_real + 1.0im * next_z_imag
    end

    return z
end

# Measure compilation time
@time begin
    for y in reverse(1:40)
        for x in -200:2:16
            result = mandelbrot(complex(x * 0.015, y * 0.02))
            print(abs(result) < 2 ? "*" : " ")
        end
        println()
    end
end

