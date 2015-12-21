function [class_labels, means, covariances] = MultivariateGaussianTrainer(features, training_mask)
%MULTIVARIATEGAUSSIANTRAINER Generates the mean vector and covariance
%matrices.
%

class_labels = unique(training_mask(training_mask > 0));
means = zeros(numel(features), numel(class_labels));
covariances = zeros(numel(features), numel(features), numel(class_labels));

for i = 1:numel(class_labels)
    class_label = class_labels(i);
    stripped_training_mask = (training_mask == class_label);
    
    features_means = zeros(numel(features), 1);
    features_stripped = [];
    for j = 1:numel(features)
        feature = features{j};
        stripped_image = feature(stripped_training_mask == true);
        
        features_means(j) = Mean(stripped_image);
        features_stripped = [features_stripped stripped_image]; %#ok<AGROW>
    end
    
    covariances(:, :, i) = cov(double(features_stripped));
    means(:, i) = features_means;
end
end

