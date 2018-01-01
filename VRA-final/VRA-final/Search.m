% Search('all_souls_000013.jpg', [136.5, 34.1, 648.5, 955.7], 'all_souls_1_query.txt', 20, 'C:\Users\nguye\Desktop\APP\VIR-Demo\VIR-Demo\' )
function result = Search( fileName, parts, top, path)
%% init parameter
addpath('AKM');
addpath('vlfeat\toolbox');
run('vlfeat\toolbox\vl_setup.m');

datasetDir = [path, 'oxford\images\'];

num_words = 50000;
num_iterations = 10;
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

% create an inverted file for the images
    fprintf('Creating and searching an inverted file\n');

    inv_file = CreateInvertedFile(words, num_words, if_weight, if_norm);
    result = QueryImage([path,'oxford\images\', fileName], parts, dict_words, dict,inv_file, if_weight,if_norm, if_dist, verbose, files, top);
    
ccvInvFileClean(inv_file{1});
end

