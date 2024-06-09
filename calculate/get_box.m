function axbox = get_box(xyz)

n = size(xyz,2);
min_data = min(xyz);
max_data = max(xyz);

axbox = reshape([min_data;max_data],1,n*2);
