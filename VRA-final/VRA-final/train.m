function  train()
%% init parameter
addpath('AKM');
addpath('vlfeat\toolbox');
run('vlfeat\toolbox\vl_setup.m');
path = '';
datasetDir = [path, 'oxford\images\'];

num_words = 100000;
num_iterations = 15;
num_trees = 8;
if_weight = 'tfidf';

if_norm = 'l2';
if_dist = 'l2';
verbose=0;

%% Compute SIFT features
    featurePath = [path, 'oxford\feat\feature.bin'];
    infoPath = [path, 'oxford\feat\feat_info.mat'];
      
    C = ComputeSIFTFeatures(datasetDir, '*.jpg', featurePath, infoPath);
    features = C.features;
    features_per_image = C.features_per_image;
    files = C.files;

%% Run AKM to build dictionary
% num_words = uint32(size(features, 2)/200);
    fprintf('Building the dictionary:\n');
    dictPath = [path, 'oxford\feat\dict.mat'];
    dict_words = BuildDictionary(features, num_iterations, num_trees, num_words, dictPath);

% compute sparse frequency vector
    fprintf('Computing the words\n');
    dict = ComputeDict(dict_words, num_iterations, num_trees);
    wordsPath = [path, 'oxford\feat\words.mat'];    
    words = ComputeWords(dict_words, features, features_per_image, wordsPath, dict);

end

