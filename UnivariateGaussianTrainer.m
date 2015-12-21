function [class_labels, means, variances] = UnivariateGaussianTrainer(training_mask, image)
%UNIVARIATEGAUSSIANCLASSIFIER Magic
%   training_mask is a matrix labels identifying pixels known to belong to
%   a class. 0 is reserved for identifying areas not in the training set.

class_labels = unique(training_mask(training_mask > 0));
means = zeros(numel(class_labels), 1);
variances = zeros(numel(class_labels), 1);

for i = 1:numel(class_labels)
    class_label = class_labels(i);
    pixel_indices = (training_mask == class_label);
    masked_image = uint8(pixel_indices) .* image;
    stripped_image = masked_image(masked_image > 0);
    means(i) = Mean(stripped_image);
    variances(i) = Variance(stripped_image);
end
end