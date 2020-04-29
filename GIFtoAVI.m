video = VideoWriter('yourvideo.avi'); %create the video object
open(video); %open the file for writing
[allframedata, map] = imread('An_MRI-Compatible_Robotic_System_for_Breast_Biopsy.gif', 'frames', 'all');
alldimensions = size(allframedata);
number_of_frames = alldimensions(end);

for i=1:number_of_frames
im = allframedata(:,:,1,i);
num = num2str(i);
nombre = strcat('im',num,'.jpg');
imwrite(im,map,nombre)  
A=imread(nombre);
writeVideo(video,A); %write the image to file
end

close(video);
