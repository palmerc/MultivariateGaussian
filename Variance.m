function [ variance ] = Variance(M)
%MATRIXVARIANCE Takes the values in the matrix and gives use variance
%   Subracts the matrix mean from each element, squares it, and then
%   averages it.
    [rows, cols] = size(M);
    squared = (double(M) - Mean(M)).^2;
    variance = sum(squared(:)) / (rows * cols);
end