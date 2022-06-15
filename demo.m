




%% load example of data
%
%
% loaded data contain the following:
%   pts        [3xN]       position of N points in 3D
%   rgb        [3xN]       color of points, they are between 1-255
%   lindex     [1xN]       example of point labeling
%   prb        [1xN]       example of probability map
%


load('data_pcl');





%% show results in matlab
set_camera = @() eval('set(gcf, ''Color'', [1 1 1]); axis off equal; campos([-14 -0 -37]); camva(40); camup([0 -1 0]); camproj(''perspective'')');  %%% these numbers are according to pts, so change them according to you dataset or as relative to mean(pts,2)
export2jpeg = 0;

%close all;
for data2show = {'rgb','lindex','prb'},  %%% show these three types of pcl colors
    data2show = data2show{1}; %%% cell of string -> string
    hf = figure();
    switch data2show,
        case 'rgb'
            honza_scatter(pts,prb*0+10,rgb'/255,'filled');
        case 'prb'
            honza_scatter(pts,prb*0+10,prb,'filled');
        case 'lindex'
            colormap jet;
            cmap = colormap();
            cmap = cmap( round(1:size(cmap,1)/max(lindex):size(cmap,1)) , : );  %%% store only idx that correspond to lindex... this depends on the application..
            honza_scatter(pts,prb*0+10,cmap(lindex,:),'filled');
    end
    set_camera();
end


if export2jpeg,
    %
    % When exporting to picture, awesome function  such as export_fig() takes
    % ages due to the large numeber of points. I used printscreen instead for pcl...
    %   sceencapture can be found at: http://www.mathworks.com/matlabcentral/fileexchange/authors/27420
    %
    set(hf,'Position',[0,0,600,700]); 
    im = screencapture(hf);
    imwrite(imcrop(im,[10 10 size(im,2)-10 size(im,1)-10]),'example_matlab_output.jpg');
end



%% export data to 3ds max




io_save_data3dsmax('data_pcl.mex_bin',pts,[],rgb,'center',0);




    