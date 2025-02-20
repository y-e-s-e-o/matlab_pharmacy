function [min_temp, range, pressure, humidity] = change_to_grade(min_temp, range, pressure, humidity, region)

switch region
    case '서울'
        % 최저기온 등급으로 환산
        if min_temp < -8.1 
            min_temp = 4;
        elseif min_temp < 0.6
            min_temp = 3;
        elseif min_temp < 13.5
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 12.5
            range = 4;
        elseif range > 9.9
            range = 3;
        elseif range > 7.3
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1017.9
            pressure = 4;
        elseif pressure > 1011.9
            pressure = 3;
        elseif pressure > 1003.5
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 37.4
            humidity = 4;
        elseif humidity < 50
            humidity = 3;
        elseif humidity < 65.9
            humidity = 2;
        else
            humidity = 1;
        end

        
    case '인천'
        % 최저기온 등급으로 환산
        if min_temp < -7.1
            min_temp = 4;
        elseif min_temp < 1.0
            min_temp = 3;
        elseif min_temp < 13.5
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 11.7
            range = 4;
        elseif range > 9.2
            range = 3;
        elseif range > 6.8
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1020.2
            pressure = 4;
        elseif pressure > 1014.1
            pressure = 3;
        elseif pressure > 1005.7
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 42.3
            humidity = 4;
        elseif humidity < 55.6
            humidity = 3;
        elseif humidity < 71.9
            humidity = 2;
        else
            humidity = 1;
        end

    case '수원'
         % 최저기온 등급으로 환산
        if min_temp < -9.0
            min_temp = 4;
        elseif min_temp < -1.1
            min_temp = 3;
        elseif min_temp < 12.2
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 15.1
            range = 4;
        elseif range > 11.7
            range = 3;
        elseif range > 8.4
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1024.7
            pressure = 4;
        elseif pressure > 1018.5
            pressure = 3;
        elseif pressure > 1009.9
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 42.1
            humidity = 4;
        elseif humidity < 56.9
            humidity = 3;
        elseif humidity < 72
            humidity = 2;
        else
            humidity = 1;
        end

    case '춘천'
         % 최저기온 등급으로 환산
        if min_temp < -12.4
            min_temp = 4;
        elseif min_temp < -2.8
            min_temp = 3;
        elseif min_temp < 10.7
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 17.8
            range = 4;
        elseif range > 14
            range = 3;
        elseif range > 10.1
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1019.2
            pressure = 4;
        elseif pressure > 1012.9
            pressure = 3;
        elseif pressure > 1004.8
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 43.9
            humidity = 4;
        elseif humidity < 59.3
            humidity = 3;
        elseif humidity < 74
            humidity = 2;
        else
            humidity = 1;
        end

    case '강릉'
         % 최저기온 등급으로 환산
        if min_temp < -5.2
            min_temp = 4;
        elseif min_temp < 1.8
            min_temp = 3;
        elseif min_temp < 13.3
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 12.8
            range = 4;
        elseif range > 9.8
            range = 3;
        elseif range > 7.2
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1023.7
            pressure = 4;
        elseif pressure > 1017.6
            pressure = 3;
        elseif pressure > 1010.1
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 26.1
            humidity = 4;
        elseif humidity < 41.8
            humidity = 3;
        elseif humidity < 67.5
            humidity = 2;
        else
            humidity = 1;
        end

    case '청주'
         % 최저기온 등급으로 환산
        if min_temp < -8.2
            min_temp = 4;
        elseif min_temp < -0.6
            min_temp = 3;
        elseif min_temp < 12.6
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 16
            range = 4;
        elseif range > 12.4
            range = 3;
        elseif range > 8.7
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1021.7
            pressure = 4;
        elseif pressure > 1015.6
            pressure = 3;
        elseif pressure > 1007.2
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 39.6
            humidity = 4;
        elseif humidity < 53.4
            humidity = 3;
        elseif humidity < 67.6
            humidity = 2;
        else
            humidity = 1;
        end

    case '대전'
         % 최저기온 등급으로 환산
        if min_temp < -7.7
            min_temp = 4;
        elseif min_temp < -0.5
            min_temp = 3;
        elseif min_temp < 12.6
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 15.8
            range = 4;
        elseif range > 12.3
            range = 3;
        elseif range > 8.6
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1020.2
            pressure = 4;
        elseif pressure > 1014.1
            pressure = 3;
        elseif pressure > 1005.8
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 40.9
            humidity = 4;
        elseif humidity < 55.9
            humidity = 3;
        elseif humidity < 69.9
            humidity = 2;
        else
            humidity = 1;
        end

    case '대구'
         % 최저기온 등급으로 환산
        if min_temp < -4.8
            min_temp = 4;
        elseif min_temp < 1.6
            min_temp = 3;
        elseif min_temp < 13.8
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 15.5
            range = 4;
        elseif range > 12.0
            range = 3;
        elseif range > 8.7
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1020.7
            pressure = 4;
        elseif pressure > 1014.7
            pressure = 3;
        elseif pressure > 1007
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 30.3
            humidity = 4;
        elseif humidity < 44.5
            humidity = 3;
        elseif humidity < 62.5
            humidity = 2;
        else
            humidity = 1;
        end

    case '전주'
         % 최저기온 등급으로 환산
        if min_temp < -6.6
            min_temp = 4;
        elseif min_temp < 0.1
            min_temp = 3;
        elseif min_temp < 12.8
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 16.4
            range = 4;
        elseif range > 12.9
            range = 3;
        elseif range > 9.1
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1022.1
            pressure = 4;
        elseif pressure > 1016.2
            pressure = 3;
        elseif pressure > 1007.6
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 44.8
            humidity = 4;
        elseif humidity < 58.1
            humidity = 3;
        elseif humidity < 69.9
            humidity = 2;
        else
            humidity = 1;
        end

    case '울산'
         % 최저기온 등급으로 환산
        if min_temp < -3.9
            min_temp = 4;
        elseif min_temp < 2.5
            min_temp = 3;
        elseif min_temp < 13.8
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 15.1
            range = 4;
        elseif range > 11.5
            range = 3;
        elseif range > 8.4
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1022.7
            pressure = 4;
        elseif pressure > 1016.8
            pressure = 3;
        elseif pressure > 1009.6
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 31.3
            humidity = 4;
        elseif humidity < 49.1
            humidity = 3;
        elseif humidity < 70
            humidity = 2;
        else
            humidity = 1;
        end

    case '마산'
         % 최저기온 등급으로 환산
        if min_temp < -3.1
            min_temp = 4;
        elseif min_temp < 3.5
            min_temp = 3;
        elseif min_temp < 14.9
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 12.5
            range = 4;
        elseif range > 10
            range = 3;
        elseif range > 7.5
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1024.5
            pressure = 4;
        elseif pressure > 1018
            pressure = 3;
        elseif pressure > 1010.4
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 31.6
            humidity = 4;
        elseif humidity < 47.3
            humidity = 3;
        elseif humidity < 68.4
            humidity = 2;
        else
            humidity = 1;
        end

    case '광주'
         % 최저기온 등급으로 환산
        if min_temp < -4.8
            min_temp = 4;
        elseif min_temp < 1.4
            min_temp = 3;
        elseif min_temp < 13.7
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 15.6
            range = 4;
        elseif range > 11.9
            range = 3;
        elseif range > 8.2
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1019.6
            pressure = 4;
        elseif pressure > 1013.8
            pressure = 3;
        elseif pressure > 1005.5
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 44.6
            humidity = 4;
        elseif humidity < 58.1
            humidity = 3;
        elseif humidity < 71.3
            humidity = 2;
        else
            humidity = 1;
        end

    case '부산'
         % 최저기온 등급으로 환산
        if min_temp < -2.9
            min_temp = 4;
        elseif min_temp < 4.7
            min_temp = 3;
        elseif min_temp < 15.1
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 11.2
            range = 4;
        elseif range > 9.0
            range = 3;
        elseif range > 6.8
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1018.1
            pressure = 4;
        elseif pressure > 1012.5
            pressure = 3;
        elseif pressure > 1005.4
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 30.1
            humidity = 4;
        elseif humidity < 46.9
            humidity = 3;
        elseif humidity < 69.3
            humidity = 2;
        else
            humidity = 1;
        end

    case '목포'
         % 최저기온 등급으로 환산
        if min_temp < -3.3
            min_temp = 4;
        elseif min_temp < 2.3
            min_temp = 3;
        elseif min_temp < 14
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 12.1
            range = 4;
        elseif range > 9.4
            range = 3;
        elseif range > 6.7
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1023.7
            pressure = 4;
        elseif pressure > 1017.9
            pressure = 3;
        elseif pressure > 1009.4
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 55.9
            humidity = 4;
        elseif humidity < 67.1
            humidity = 3;
        elseif humidity < 79.4
            humidity = 2;
        else
            humidity = 1;
        end

    case '제주'
         % 최저기온 등급으로 환산
        if min_temp < 1.7
            min_temp = 4;
        elseif min_temp < 6.5
            min_temp = 3;
        elseif min_temp < 16
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 10.4
            range = 4;
        elseif range > 7.4
            range = 3;
        elseif range > 5.0
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1025.6
            pressure = 4;
        elseif pressure > 1019.8
            pressure = 3;
        elseif pressure > 1011.2
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 45.6
            humidity = 4;
        elseif humidity < 56.5
            humidity = 3;
        elseif humidity < 69.0
            humidity = 2;
        else
            humidity = 1;
        end

    case '서귀포'
         % 최저기온 등급으로 환산
        if min_temp < 1.9
            min_temp = 4;
        elseif min_temp < 7.8
            min_temp = 3;
        elseif min_temp < 17.0
            min_temp = 2;
        else
            min_temp = 1;
        end

        % 일교차 등급으로 환산
        if range > 9.9
            range = 4;
        elseif range > 8.0
            range = 3;
        elseif range > 5.9
            range = 2;
        else
            range = 1;
        end

        % 기압 등급으로 환산
        if pressure > 1020.5
            pressure = 4;
        elseif pressure > 1015
            pressure = 3;
        elseif pressure > 1007.5
            pressure = 2;
        else
            pressure = 1;
        end

        % 습도 등급으로 환산
        if humidity < 44.4
            humidity = 4;
        elseif humidity < 56.6
            humidity = 3;
        elseif humidity < 71.9
            humidity = 2;
        else
            humidity = 1;
        end
end

end