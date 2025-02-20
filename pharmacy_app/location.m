function [latitudes_current, longitudes_current] = location(filename, filepath)
%'/Users/yeseo/Desktop/3-2/항공우주응용 SW1/Project/pharmacy_app/nmea_log.txt'

fileID = fopen([filepath,filename], 'r');
data2 = textscan(fileID, '%s', 'Delimiter', '\n');
fclose(fileID);

nmea_data = data2{1};
latitudes_current = [];
longitudes_current = [];

for i = 1:length(nmea_data)
    line = nmea_data{i};
    
    % start with $GPGGA
    if startsWith(line, '$GPGGA')

        parts = strsplit(line, ',');
        
        latitude_str = parts{3};
        latitude_dir = parts{4};  % (N/S)
        longitude_str = parts{5};
        longitude_dir = parts{6};  % (E/W)
        
        % using only valid data
        if ~isempty(latitude_str) && ~isempty(longitude_str)
            
            latitude = str2double(latitude_str);
            longitude = str2double(longitude_str);

            
            if latitude ~= 0 && longitude ~= 0
                
                lat_deg = floor(latitude / 100);
                lat_min = mod(latitude, 100);
                latitude_decimal = lat_deg + lat_min / 60;
                if strcmp(latitude_dir, 'S')
                    latitude_decimal = -latitude_decimal;
                end

                
                lon_deg = floor(longitude / 100);
                lon_min = mod(longitude, 100);
                longitude_decimal = lon_deg + lon_min / 60;
                if strcmp(longitude_dir, 'W')
                    longitude_decimal = -longitude_decimal;
                end

                
                latitudes_current = [latitudes_current; latitude_decimal];
                longitudes_current = [longitudes_current; longitude_decimal];
            end
        end
    end
end


end
