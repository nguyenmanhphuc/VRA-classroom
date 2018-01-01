function imageIndex = trainSURF( )

    store =  imageDatastore(fullfile('oxford\images'),'FileExtensions','.jpg');
    if ~ exist('oxford\bag50000.mat', 'file')
        
         bag = bagOfFeatures(store, 'VocabularySize', 50000,'PointSelection','Detector',...,
         'StrongestFeatures', 1, 'Verbose', true);
     save('oxford\bag50000.mat', 'bag');
    else
     load('oxford\bag50000.mat', 'bag');
    end
    imageIndex = indexImages(store, bag);
end

