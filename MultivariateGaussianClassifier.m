function [class] = MultivariateGaussianClassifier(features, class_labels, means, covariances)
%MULTIVARIATEGAUSSIANCLASSIFIER
%   

[rows, columns] = size(features{1});

class = zeros(rows, columns);
feature_count = numel(features);
class_count = numel(class_labels);
for row = 1:rows
    for column = 1:columns
        pixel_gray_levels = zeros(feature_count, 1);
        for i = 1:feature_count
            image = features{i};
            gray_level = double(image(row, column));
            pixel_gray_levels(i) = gray_level;
        end
        
        maximum_class = 0;
        maximum_value = 0;
        for i = 1:class_count
            class_label = class_labels(i);
            mus = means(:, i);
            covariance = covariances(:, :, i);
            covariance_determinant = det(covariance);
            covariance_inverse = inv(covariance);
            gauss = -(1/2)*(pixel_gray_levels - mus)' * covariance_inverse * ...
                (pixel_gray_levels - mus) - (feature_count/2) * ...
                log(2 * pi) - (1/2) * log(covariance_determinant) + log(1/class_count); %#ok<MINV>
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

