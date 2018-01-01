function output = ComputeSIFTFeatures(datasetDir, pattern, featurePath,infoPath)
    if ~exist(featurePath, 'file')
        files = getFiles(datasetDir, pattern);
        fprintf('Computing SIFT features:\n');

        features = zeros(128, 12000000);
        nfeat = 0;
        nfiles = length(files);
        features_per_image = zeros(1,nfiles);
        for i=1:nfiles
            fprintf('Extracting features %d/%d\n', i, nfiles);
            imgPath = strcat(datasetDir, files(i).name);
            I = im2single(rgb2gray(imread(imgPath)));
            I = imresize(I, 0.6);
            [frame, sift] = ComputeRootSIFTFeatures(I);
            countFeatures = size(sift, 2);
            if nfeat+ countFeatures > size(features,2)
                features = [features zeros(128,1000000)];
            end
            features(:,nfeat+1:nfeat+countFeatures) = sift;
            nfeat = nfeat+countFeatures;
            features_per_image(i) = countFeatures;
        end 
        features = features(:,1:nfeat);
 
        fid = fopen(featurePath, 'w');
        fwrite(fid, features, 'float');
        fclose(fid);

        save(infoPath, 'features_per_image', 'files');
    else
        fprintf('Loading SIFT features:\n');
        file = dir(featurePath);
        %features = zeros(128, file.bytes/(4*128), 'single');

        fid = fopen(featurePath, 'r');
        features = fread(fid, [128, file.bytes/(4*128)], 'float');
        fclose(fid);

       info = LoadInfo(infoPath);
       files = info.files;
       features_per_image = info.features_per_image;
    end
    output.features = features;
    output.features_per_image = features_per_image;
    output.files = files;
end

