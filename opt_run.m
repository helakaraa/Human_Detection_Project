img1=imread('frame1.png');
img2=imread('frame2.png');
img1=imresize(img1, [120 175]);
img2=imresize(img2,[120 175]);
Human1 = double(rgb2gray(img1));
Human2 = double(rgb2gray(img2));

I1 = Human1;
I2 = Human2;
figure;
[u,v,hitMap] = opticalFlow(double(I1),double(I2),29,0.015);
[y,x] = meshgrid(1:3:size(I1,1),1:3:size(I1,2));
subplot(1,2,1); imshow(img2), hold on,quiver(x',y',u(1:3:size(I1,1),1:3:size(I1,2)),v(1:3:size(I1,1),1:3:size(I1,2)));
axis([0,size(I1,2),0,size(I1,1)]);
title({'(a) Result of dense optical flow on human sequence','windowsize: 29'});
[u,v] = LK_pyramid(I1,I2,3,3,29,0.015);
subplot(1,2,2); imshow(img2),hold on,quiver(x',y',u(1:3:size(I1,1),1:3:size(I1,2)),v(1:3:size(I1,1),1:3:size(I1,2)));
axis([0,size(I1,2),0,size(I1,1)]);
title({'(a) Result of LK optical flow on human sequence','windowsize: 29'});
