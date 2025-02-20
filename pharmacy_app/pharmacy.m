function [latitude_pha, longitude_pha, pharmacy_names] = pharmacy()

filename = '서울시 약국 운영시간 정보.csv';
data = readtable(filename, 'TextType', 'string', 'VariableNamingRule', 'preserve');
data = rmmissing(data);

latitude_pha = data.('병원위도');
longitude_pha = data.('병원경도');
pharmacy_names = data.('약국명');

end