function BaiTap19()
 imgI = imread('cameraman.jpg');
 points = detectSURFFeatures(imgI);
 [features, validPoints] = extractFeatures(imgI, points);
 
 figure;
 imshow(imgI);
 subValidPoints = validPoints.selectStrongest(20);
 hold on;
 plot(subValidPoints);
end

