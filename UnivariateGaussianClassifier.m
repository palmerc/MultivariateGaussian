function [ class ] = UnivariateGaussianClassifier(image, class_labels, means, variances)
%UNIVARIATEGAUSSIANCLASSIFIER
%   

[rows, columns] = size(image);

class = zeros(rows, columns);
for row = 1:rows
    for column = 1:columns
        gray_level = double(image(row, column));
        maximum_class = 0;
        maximum_value = 0;
        for i = 1:numel(class_labels)
            class_label = class_labels(i);
            mu = means(i);
            sigma = sqrt(variances(i));
            gauss = GaussianProbabilityDensity(gray_level, sigma, mu);
            if i == 1
                maximum_class = class_label;
                maximum_value = gauss;
            elseif gauss > maximum_value
                maximum_class = class_label;
                maximum_value = gauss;
            end
        end
        class(row, column) = maximum_class;
    end
end

end

