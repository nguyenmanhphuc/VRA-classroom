function BaiTap025()
    rootFolder = fullfile('DataTrain');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds);
    minSetCount = min(tbl01{:, 2});
    imds = splitEachLabel(imds, minSetCount, 'randomize');
    tbl02 = countEachLabel (imds);
%     bag = bagOfFeatures(imds);
%     save('BagOfWords.mat', 'bag');
    
    load('BagOfWords.mat', 'bag');
    
    img  = readimage(imds, 1);
    featureVector = encode (bag, img);
    figure
    bar(featureVector);
    title('Visual word occurences')
    xlabel('Visual word index')
    ylabel('Frequency of occurrence')
    categoryClassifier = trainImageCategoryClassifier(imds, bag);
     save('categoryClassifier.mat', 'categoryClassifier');
    
    rootTestFolder = fullfile('DataTest');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootTestFolder, categories), 'LabelSource', 'foldernames');
%     tbl01 = countEachLabel(imds);
    confMatrixTest = evaluate(categoryClassifier, imds);
    mean(diag(confMatrixTest));
end

