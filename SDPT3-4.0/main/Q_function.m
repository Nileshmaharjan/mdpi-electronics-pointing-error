function result = Q_function(x)
    integrand = @(t) exp(-t.^2 / 2);
    result = integral(integrand, x, Inf);
end
