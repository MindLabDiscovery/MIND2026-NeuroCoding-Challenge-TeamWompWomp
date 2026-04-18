% NIFTI UI Slider
filepath = 'Downloads\sub-001_ses-2024110601_acq-2mm_T1w.nii';
V = double(niftiread(filepath));        
vol = rot90(V,1);                       
numSlices = size(vol,3);

fig = uifigure('Name','NIfTI Viewer');
ax  = uiaxes(fig, 'Position',[20 0 560 560]); colormap(ax,gray)
h = imshow(vol(:,:,1), [], 'Parent', ax);

s = uislider(fig, 'Limits',[1 numSlices], 'Value',1, 'Position',[80 30 420 3]);
s.ValueChangingFcn = @(src,ev) set(h,'CData',vol(:,:,round(ev.Value)));
