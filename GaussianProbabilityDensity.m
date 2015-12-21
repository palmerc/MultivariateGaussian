function [ gauss ] = GaussianProbabilityDensity(X, sigma, mu)
%GAUSSIANPROBABILITYDENSITY This is the implementation of the Gaussian
%discriminant function for use in the classifier.
%
gauss = zeros(numel(X), 1);

for i = 1:numel(X)
    gauss(i) = 1/(sigma * sqrt(2 * pi)) * exp(-(1/2)*((X(i) - mu)/sigma)^2);
end

end

