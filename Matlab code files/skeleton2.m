




%Initializing the joint map for the skeleton construction
SkeletonConnectionMap = [[1 2]; % Spine
                         [2 3];
                         [3 4];
                         [3 5]; %Left Hand
                         [5 6];
                         [6 7];
                         [7 8];
                         [3 9]; %Right Hand
                         [9 10];
                         [10 11];
                         [11 12];   
                         [1 17]; % Right Leg
                         [17 18];
                         [18 19];
                         [19 20];
                         [1 13]; % Left Leg
                         [13 14];
                         [14 15];
                         [15 16]];
metaDataDepth;
f1=1;
%To check if any skeletons are tracked

for j=1:200
        if(any(metaDataDepth(j).IsSkeletonTracked == 1))
            f1=j;
            break;
      
    end
    
end
f3=200;
f2=floor((f3+f1)/2);

    
anyPositionsTracked1 = any(metaDataDepth(f1).IsPositionTracked ~= 0);
anySkeletonsTracked1= any(metaDataDepth(f1).IsSkeletonTracked ~= 0);
%To find tracked skeleton numbers
trackedSkeletons1 = find(metaDataDepth(f1).IsSkeletonTracked);
%To extract joint coordinates and indices
jointCoordinates1 = metaDataDepth(f1).JointWorldCoordinates(:, :, trackedSkeletons1);
jointIndices1 = metaDataDepth(f1).JointImageIndices(:, :, trackedSkeletons1);
%Repeat for different frame intervals
anyPositionsTracked2 = any(metaDataDepth(f2).IsPositionTracked ~= 0);
anySkeletonsTracked2 = any(metaDataDepth(f2).IsSkeletonTracked ~= 0);
trackedSkeletons2 = find(metaDataDepth(f2).IsSkeletonTracked);
jointCoordinates2 = metaDataDepth(f2).JointWorldCoordinates(:, :, trackedSkeletons2);
jointIndices2 = metaDataDepth(f2).JointImageIndices(:, :, trackedSkeletons2);
anyPositionsTracked3 = any(metaDataDepth(f3).IsPositionTracked ~= 0);
anySkeletonsTracked3 = any(metaDataDepth(f3).IsSkeletonTracked ~= 0);
trackedSkeletons3 = find(metaDataDepth(f3).IsSkeletonTracked);
jointCoordinates3 = metaDataDepth(f3).JointWorldCoordinates(:, :, trackedSkeletons3);
jointIndices3 = metaDataDepth(f3).JointImageIndices(:, :, trackedSkeletons3);
%Initializing nSkeleton for total number of skeletons
nSkeleton1 = length(trackedSkeletons1);
nSkeleton2 = length(trackedSkeletons2);
nSkeleton3 = length(trackedSkeletons3);

%Extracting RGB images from camera
image1 = frameDataColor(:, :, :, f1);

image2 = frameDataColor(:, :, :, f2);

image3 = frameDataColor(:, :, :, f3);
subplot(3,2,1)
imshow(image1);
 for i = 3:11
     
     if nSkeleton1 > 0
         X1 = [jointIndices1(SkeletonConnectionMap(i,1),1,1) jointIndices1(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices1(SkeletonConnectionMap(i,1),2,1) jointIndices1(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker','+' , 'Color', 'b');
     end
     if nSkeleton1 > 1
         X2 = [jointIndices1(SkeletonConnectionMap(i,1),1,2) jointIndices1(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices1(SkeletonConnectionMap(i,1),2,2) jointIndices1(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
subplot(3,2,3)
imshow(image2);
 for i = 3:11
     
     if nSkeleton2 > 0
         X1 = [jointIndices2(SkeletonConnectionMap(i,1),1,1) jointIndices2(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices2(SkeletonConnectionMap(i,1),2,1) jointIndices2(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
     if nSkeleton2 > 1
         X2 = [jointIndices2(SkeletonConnectionMap(i,1),1,2) jointIndices2(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices2(SkeletonConnectionMap(i,1),2,2) jointIndices2(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 
subplot(3,2,5)
imshow(image3);
  for i = 3:11
     
     if nSkeleton3 > 0
         X1 = [jointIndices3(SkeletonConnectionMap(i,1),1,1) jointIndices3(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices3(SkeletonConnectionMap(i,1),2,1) jointIndices3(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'r');
     end
     if nSkeleton3 > 1
         X2 = [jointIndices3(SkeletonConnectionMap(i,1),1,2) jointIndices3(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices3(SkeletonConnectionMap(i,1),2,2) jointIndices3(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 




 
figure
a=ones(480,640);
imshow(a);
%  Drawing the joints for the skeleton
 for i = 3:11
     
     if nSkeleton1 > 0
         X1 = [jointIndices1(SkeletonConnectionMap(i,1),1,1) jointIndices1(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices1(SkeletonConnectionMap(i,1),2,1) jointIndices1(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton1 > 1
         X2 = [jointIndices1(SkeletonConnectionMap(i,1),1,2) jointIndices1(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices1(SkeletonConnectionMap(i,1),2,2) jointIndices1(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 
  for i = 3:11
     
     if nSkeleton2 > 0
         X1 = [jointIndices2(SkeletonConnectionMap(i,1),1,1) jointIndices2(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices2(SkeletonConnectionMap(i,1),2,1) jointIndices2(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton2 > 1
         X2 = [jointIndices2(SkeletonConnectionMap(i,1),1,2) jointIndices2(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices2(SkeletonConnectionMap(i,1),2,2) jointIndices2(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 


 
  for i = 3:11
     
     if nSkeleton3 > 0
         X1 = [jointIndices3(SkeletonConnectionMap(i,1),1,1) jointIndices3(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices3(SkeletonConnectionMap(i,1),2,1) jointIndices3(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton3 > 1
         X2 = [jointIndices3(SkeletonConnectionMap(i,1),1,2) jointIndices3(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices3(SkeletonConnectionMap(i,1),2,2) jointIndices3(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
  end
 
 img=getframe(gca);
 im=frame2im(img);
 BW=im2bw(im);
figure
 imshow(BW);
% stats=regionprops(BW,'BoundingBox');
% hold on;
% for k=1:10 % Loop through all blobs.
	% Find the bounding box of each blob.
%	thisBlobsBoundingBox = stats(k).BoundingBox;  
%	rectangle('Position', thisBlobsBoundingBox);
%end
%hold off;
 A=jointCoordinates1;
 B=jointCoordinates2;    
 C=jointCoordinates3;
 try
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Deepthi\gesture1_10.xls',A,1);
 catch
     warning('Late Start');
 end
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Kunal\gesture1_10.xls',B,2);
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Kunal\gesture1_10.xls',C,3);
 
 title('Final Image');
 imsave

 

