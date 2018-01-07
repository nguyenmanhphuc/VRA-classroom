function Q2_ShowTestImage(n)
   load('Test.mat','testData', 'testLabels');
    
    img = reshape(testData(n, :), 112, 92);
    figure;
    imshow(img);
    title(['Object: ', num2str(testLabels(n))]);
end

