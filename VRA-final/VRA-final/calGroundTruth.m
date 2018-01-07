% Search('all_souls_000013.jpg', [136.5, 34.1, 648.5, 955.7], 20, 'C:\Users\nguye\Desktop\APP\VIR-Demo\VIR-Demo\' )
function calGroundTruth()
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

    fprintf('Creating and searching an inverted file\n');

    inv_file = CreateInvertedFile(words, num_words, if_weight, if_norm);
   
    q_files = dir(fullfile('oxford\groundtruth', '*query.txt'));
    ntop = 0;
    % load query image
    for k=1:length(q_files)
        fid = fopen(strcat('oxford\groundtruth\', q_files(k).name), 'r');
        str = fgetl(fid);
        [image_name, remain] = strtok(str, ' ');
        fclose(fid);
        numbers = str2num(remain);

        file = strcat('oxford\images\', image_name(6:end), '.jpg');
%         I = im2single(rgb2gray(imread(file)));
%         % compute rootSIFT features
%         [frame, sift]= ComputeRootSIFTFeatures(I);
%         sift = sift(:,(frame(1,:)<=x2) &  (frame(1,:) >= x1) & (frame(2,:) <= y2) & (frame(2,:) >= y1));
% 
%         q_words = cell(1,1);
%         q_words{1} = ccvBowGetWords(dict_words, double(sift), [], dict);
%         [ids dists] = ccvInvFileSearch(inv_file, q_words(1), if_weight, if_norm, if_dist, ntop);
        result = QueryImage([path, file], numbers, dict_words, dict,inv_file, if_weight,if_norm, if_dist, verbose, files, ntop);

        fid = fopen('oxford\groundtruth\rank_list.txt', 'w');
        for i=1:size(result,2)
            fprintf(fid, '%s\n', result{i}(1:end-4));
        end
        fclose(fid);
        script = ['oxford\groundtruth\Test.exe oxford\groundtruth\', ...
            q_files(k).name(1:end-10), ...
            ' oxford\groundtruth\rank_list.txt',...
            ' >oxford\result\', image_name(6:end), '_result.txt']; %q_files(k).name(1:end-10)
        system(script);

    end

    r_files = dir(fullfile('oxford\result\', '*.txt'));
    acc = [];
    for i=1:length(r_files)
        file = ['oxford\result\' r_files(i).name];
        fid = fopen(file, 'r');
        acc = [acc fscanf(fid, '%f')];
        fclose(fid);
    end
    mean(acc)
end

