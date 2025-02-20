function [avg_lat, avg_lon] = avg_location(lat_list, lon_list)
sum_lat = 0;
sum_lon = 0;

for i = 1:length(lat_list)
    sum_lat = sum_lat + lat_list(i);
    sum_lon = sum_lon + lon_list(i);
end

% 위도, 경도 평균내기
avg_lat = sum_lat/ length(lat_list);
avg_lon = sum_lon/ length(lon_list);

end
