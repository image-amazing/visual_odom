function tracks=compute_tracks(file_name)
fid = fopen(file_name);
tline = fgets(fid);
num_keys = 5;
k = 1;
points = zeros(num_keys,1300,2);
while ischar(tline)
%     disp(tline);
    for j = 1:k-2
        tline = fgets(fid);
        tline = fgets(fid);
        num_points=sscanf(tline,'%d');
        for p=1:num_points
            tline = fgets(fid);;
        end
    end
        if(k ~= 1)
        tline = fgets(fid);
        end
        tline = fgets(fid);
        num_points=sscanf(tline,'%d');
    for p=1:num_points
         tline = fgets(fid);
         points(k,p,:) = sscanf(tline,'%d');
    end
      
        
    k=k+1;
    if k >= num_keys
        break
    end
end
j = points(1,:,1);
for k = 2:num_keys-1
    j = intersect(j,points(k,:,1));
end
tracks = zeros(size(j,2),num_keys);
for s = 1:size(j,2)
    tracks(s,1) = j(s);
    for k =2:num_keys
        for t=1:1300
            if points(k-1,t,1) == j(s)
                tracks(s,k) = points(k-1,t,2);
            end
        end
    end
end