clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
%Enter the Path to find source Images
PathTo_Images_To_Label='Path_to_Source_images';
%Enter the Path to save Masked Images
PathTo_Save_Masked='Path_to_Masked_Images';
%Lists all the files in given path
X=dir(PathTo_Images_To_Label);
tic
%Run the Loop from Third element to N th element in the folder
%Starts from Third Element Because first two are empty directories returned by Matlab Function -- WINDOWS Specific
%Change the index from 1:numel(X) for other OS
for i=3:numel(X)
    Source_Filename=X(i).name;
	%Assumes source file name ends with '.tiff' (5 Characters) and takes name excluding extension
	%Kindly Change (1:end-'x', x is number of characters in your extension) according to your image extension
    Masked_Filename=strcat(Source_Filename(1:end-5),'_Masked.tiff');
    image1=imread(fullfile(PathTo_Images_To_Label,Source_Filename));
    figure;imshow(image1);
    [x y z] = size(image1);
    totMask = false(x,y);
    handles = imfreehand();
    position = wait( handles );
    lastroi = handles;
    while ~isempty(lastroi)
        lastroi = imfreehand();
        position = wait( lastroi );
        handles = cat(1, handles, lastroi);
    end
    handles = handles(isvalid(handles));

    for k=1:numel(handles)
        totMask = totMask | createMask(handles(k));
    end
    figure; imshow( totMask ); title('multi-object mask')
    imwrite(totMask,fullfile(PathTo_Save_Masked,Masked_Filename));
	%Saves the count of number of objects labelled into a text file.
	%Assumes source file name ends with '.tiff' (5 Characters) and takes name excluding extension
	%Kindly Change (1:end-'x', x is number of characters in your extension) according to your image extension
    Text_Filename = strcat(Masked_Filename(1:end-5),'.txt');
    fid=fopen(fullfile(PathTo_Save_Masked,Text_Filename),'wt');
    fprintf(fid,int2str(numel(handles)));
    fclose(fid);
    display(int2str(numel(handles)),'Number of Cells Marked');
end
close all;
toc