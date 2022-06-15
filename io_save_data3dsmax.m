%
%
%
%
% save data in a form that maxscript can read
%
%
%
%
% Code is free to use, but if you use it (or its part) in you publication
% cite ***.
%
% honza knopp, 2014
%
%
%
%
%
%
function []=io_save_data3dsmax(path,pts,tri,col,varargin)
p = inputParser;
p.addOptional('center', 0);
p.parse(varargin{:}); fldnames = fieldnames(p.Results); for a=1:length(fldnames), eval([fldnames{a},' = p.Results.',fldnames{a},';']); end;



%% init
if isempty(col),
    col = pts(3,:);
    col = col-min(col);
    col = col/max(col);
end


if center,
    pts = bsxfun(@plus,pts,-mean(pts,2));
end



%% save


data2save = [pts ; col];
fid = fopen(path, 'w');
fwrite(fid, size(data2save,1),'single');
fwrite(fid, size(data2save,2),'single');
fwrite(fid, size(tri,2),'single'); %%% it is zero for point cloud :)
fwrite(fid, data2save(:),'single'); %%% vertices + their color
fwrite(fid, tri(:),'single'); %%% traingles + their color
fclose(fid);


fprintf('  ...io_3dsmax: data saved for maxscript, output file is  ''%s''\n',path);


end









