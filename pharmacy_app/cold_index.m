function level = cold_index(min_temp, range, pressure, humidity, region)

% 지역별로 기상요소를 등급으로 환산
[min_temp, range, pressure, humidity] = change_to_grade(min_temp, range, pressure, humidity, region);

% 지역별로 가중치 계산
[a, b, c, d] = find_weight(region);

% 감기지수 계산
cold_index = a*min_temp + b*range + c*pressure + d*humidity;

if cold_index >= 3.1316
    level = '매우 높음';
elseif cold_index >= 2.6918
    level = '높음';
elseif cold_index >= 1.4759
    level = '보통';
else
    level = '낮음';
end

end
