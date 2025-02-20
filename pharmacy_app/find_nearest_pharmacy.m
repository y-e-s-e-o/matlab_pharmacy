function [min_distance, min_index, nearest_pharmacy] = find_nearest_pharmacy(current_lat, latitude_pha, current_lon, longitude_pha, pharmacy_names)

% calculate distance
distance = haversine(current_lat, latitude_pha, current_lon, longitude_pha);

% find nearest pharmacy
[min_distance, min_index] = min(distance);

nearest_pharmacy = pharmacy_names(min_index);

end
