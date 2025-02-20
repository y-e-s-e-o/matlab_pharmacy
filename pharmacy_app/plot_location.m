function plot_location(axes1, latitude_pha, longitude_pha, min_index, current_lat, current_lon, latitudes_current, longitudes_current)

% plot
axes(axes1);

% 약국 위치 plot
geoplot(latitude_pha(min_index), longitude_pha(min_index), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

% 현재 위치 plot
geoplot(current_lat, current_lon, 'ro','MarkerSize', 10,'LineWidth',2);
hold on;

%이동 경로 plot
geoplot(latitudes_current,longitudes_current,'g-','LineWidth', 0.5)
title('서울 약국 위치 지도');
legend('약국 위치', '현재 위치');
grid on;
hold on;
