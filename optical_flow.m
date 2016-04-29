
% reading video

videoReader = vision.VideoFileReader('viptrain.avi','ImageColorSpace','Intensity','VideoOutputDataType','uint8');

% videoReader = vision.VideoFileReader('xylophone.mp4','ImageColorSpace','Intensity','VideoOutputDataType','uint8');


% covert into images

converter = vision.ImageDataTypeConverter;

% optical flow application

opticalFlow = vision.OpticalFlow('ReferenceFrameDelay', 1);

opticalFlow.OutputValue = 'Horizontal and vertical components in complex form';

if 0 

opticalFlow.Method = 'Lucas-Kanade';

opticalFlow.NoiseReductionThreshold = 0.001; 

else

opticalFlow.Method = 'Horn-Schunck';

opticalFlow.Smoothness = 0.5; 

end


frame = step(videoReader);

figure

subplot(121)

himg = imshow(frame);

subplot(122)

hof = imshow(frame);

while ~isDone(videoReader)
   frame = step(videoReader);
   im = step(converter, frame);
   im=imresize(im, [128,256]);
for j=1:7
         Img=im(1:128,1+64*(j-1)-32*(j-1): 64*j-32*(j-1),:);
    if (SVMClassification(Img)==1)
          k=1+64*(j-1)-32*(j-1);
          rect = [k,  1, 64, 128];
          rgb = [255, 0 , 0];
          thickness = 3;
          H=drawBox(frame, rect, rgb, thickness);
         
    end       
         
end
   of = step(opticalFlow,H);
   ofI = computeColor(real(of), imag(of));        
   set(himg, 'cdata', frame)
   set(hof, 'cdata', ofI)
   drawnow   
   
end  
release(videoReader);

