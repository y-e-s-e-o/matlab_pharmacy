% haversine 함수
function [dist] = haversine(lat1, lat2, lon1, lon2)
    % Earth radius
    R = 6371;

    % deg to rad
    lat1 = deg2rad(lat1);
    lat2 = deg2rad(lat2);
    lon1 = deg2rad(lon1);
    lon2 = deg2rad(lon2);

    % haversine
    dlat = lat2 - lat1;
    dlon = lon2 - lon1;
    a = sin(dlat / 2).^2 + cos(lat1) .* cos(lat2) .* sin(dlon / 2).^2;
    c = 2 * atan2(sqrt(a), sqrt(1 - a));

    % calculate distance
    dist = R * c;
end
