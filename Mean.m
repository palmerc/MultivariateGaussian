function [ mean ] = Mean(M)
%MATRIXMEAN Gets the mean of the matrix
%   Sums up the values and divides by the number of values
    [rows, cols] = size(M);
    total = sum(M(:)); 
    mean = total / (rows * cols);
end