function Q1_ShowTrainImage(n)
   load('Train.mat','trainData', 'trainLabels');
    
    img = reshape(trainData(n, :), 112, 92);
    figure;
    imshow(img);
    title(['Object: ', num2str(trainLabels(n))]);
end

