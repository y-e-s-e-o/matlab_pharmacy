function [current_temp, min_temp, range, pressure, humidity] = weather(lat_list, lon_list)

% 위치 평균내기
[avg_lat, avg_lon] = avg_location(lat_list, lon_list);

key = 'f3e6b3f42d89a5763737bf57a75be255';

url = ['https://api.openweathermap.org/data/3.0/onecall?lat=',num2str(avg_lat),'&lon=',num2str(avg_lon),'&lang=kr&units=metric&appid=', key];

options = weboptions('ContentType','auto');
weather_data = webread(url,options);

current_temp = weather_data.current.temp;
pressure = weather_data.current.pressure;
humidity = weather_data.current.humidity;

if class(weather_data.daily) == 'cell'
    min_temp = weather_data.daily{1,1}.temp.min;
    range = weather_data.daily{1,1}.temp.max - weather_data.daily{1,1}.temp.min;
else
    min_temp = weather_data.daily(1).temp.min;
    range = weather_data.daily(1).temp.max - weather_data.daily(1).temp.min;

end
