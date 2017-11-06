function BaiTap18()
 imgI = imread('cameraman.jpg');
 figure;
 imshow(imgI);
 points = detectHarrisFeatures(imgI);
 hold on;
 subpoints = points.selectStrongest(20);
 plot(subpoints);
end

