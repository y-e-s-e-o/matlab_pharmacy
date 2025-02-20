function varargout = pharmacy_app(varargin)
% PHARMACY_APP MATLAB code for pharmacy_app.fig
%      PHARMACY_APP, by itself, creates a new PHARMACY_APP or raises the existing
%      singleton*.
%
%      H = PHARMACY_APP returns the handle to a new PHARMACY_APP or the handle to
%      the existing singleton*.
%
%      PHARMACY_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHARMACY_APP.M with the given input arguments.
%
%      PHARMACY_APP('Property','Value',...) creates a new PHARMACY_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pharmacy_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pharmacy_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pharmacy_app

% Last Modified by GUIDE v2.5 27-Nov-2024 21:39:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pharmacy_app_OpeningFcn, ...
                   'gui_OutputFcn',  @pharmacy_app_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before pharmacy_app is made visible.
function pharmacy_app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pharmacy_app (see VARARGIN)

% pharmacy 함수: 약국 정보 가져오기
[handles.latitude_pha, handles.longitude_pha, handles.pharmacy_names] = pharmacy();

% open_window창에서 입력한 파일과, 지역 데이터 가져오기
load('filename.mat');
load('filepath.mat');

% location함수: 이동경로의 위도, 경도 정보 가져오기
[handles.latitudes_current, handles.longitudes_current] = location(filename, filepath);
% 마지막 위치, 즉 현재위치의 위도, 경도 저장
handles.current_lat = handles.latitudes_current(length(handles.latitudes_current));
handles.current_lon = handles.longitudes_current(length(handles.longitudes_current));

% weather함수: 이동경로의 평균 날씨 데이터 가져오기
[handles.current_temperature, handles.min_temperature, handles.daily_temperature_range, ...
    handles.current_pressure, handles.current_humidity] = weather(handles.latitudes_current, handles.longitudes_current);


% Choose default command line output for pharmacy_app
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes pharmacy_app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pharmacy_app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_find.
function pushbutton_find_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%%%% 약국 %%%%%%
% find_nearest_pharmacy 함수: 현재 위치에서 가장 가까운 약국 위치 찾기
[handles.min_distance, handles.min_index, handles.nearest_pharmacy] = find_nearest_pharmacy(handles.current_lat, ...
    handles.latitude_pha, handles.current_lon, handles.longitude_pha, handles.pharmacy_names);

% GUI에 약국 정보 출력
set(handles.edit_pharmacy,'String',handles.nearest_pharmacy);
set(handles.edit_distance,'String',sprintf('%.3f km',handles.min_distance));

% plot_location 함수: 현재위치와 약국위치, 이동경로 plot
plot_location(handles.axes1, handles.latitude_pha, handles.longitude_pha, handles.min_index, ...
    handles.current_lat, handles.current_lon, handles.latitudes_current, handles.longitudes_current);


%%%%% 날씨 %%%%%%
load('region.mat');

% cold_index 함수: 감기 가능지수 계산
level = cold_index(handles.min_temperature, handles.daily_temperature_range, ...
    handles.current_pressure, handles.current_humidity, region);

% GUI에 날씨 정보 출력
set(handles.edit_temperature, 'String', sprintf("%.1f ℃", handles.current_temperature));
set(handles.edit_humidity, 'String', sprintf("%d %%", handles.current_humidity));
set(handles.edit_temperature_range, 'String', sprintf("%.1f ℃" + ...
    "", handles.daily_temperature_range));
set(handles.edit_coldindex, 'String', level);


guidata(hObject, handles);


function edit_pharmacy_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pharmacy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pharmacy as text
%        str2double(get(hObject,'String')) returns contents of edit_pharmacy as a double


% --- Executes during object creation, after setting all properties.
function edit_pharmacy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pharmacy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_distance_Callback(hObject, eventdata, handles)
% hObject    handle to edit_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_distance as text
%        str2double(get(hObject,'String')) returns contents of edit_distance as a double


% --- Executes during object creation, after setting all properties.
function edit_distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton_find.
function pushbutton_find_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to edit_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_temperature as text
%        str2double(get(hObject,'String')) returns contents of edit_temperature as a double


% --- Executes during object creation, after setting all properties.
function edit_temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_temperature_range_Callback(hObject, eventdata, handles)
% hObject    handle to edit_temperature_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_temperature_range as text
%        str2double(get(hObject,'String')) returns contents of edit_temperature_range as a double


% --- Executes during object creation, after setting all properties.
function edit_temperature_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_temperature_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_humidity_Callback(hObject, eventdata, handles)
% hObject    handle to edit_humidity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_humidity as text
%        str2double(get(hObject,'String')) returns contents of edit_humidity as a double


% --- Executes during object creation, after setting all properties.
function edit_humidity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_humidity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_coldindex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_coldindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_coldindex as text
%        str2double(get(hObject,'String')) returns contents of edit_coldindex as a double


% --- Executes during object creation, after setting all properties.
function edit_coldindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_coldindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_update.
function pushbutton_update_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

update_state = questdlg('Continue?', 'UPDATE', 'YES', 'NO', 'NO');

if strcmp(update_state, 'YES')

    % 창 닫기
    close all

    option = menu('Choose a change option', 'change file only', 'change region only','change both');
    
    % 업데이트 여부 저장
    save('update_state', 'option');

    % 창 열기
    open_window();

else
    % 저장한 모든 데이터 지우기
    if exist('update_state.mat')
        delete('update_state.mat')
    end

    delete('filename.mat');
    delete('filepath.mat');
    delete('region.mat');
    delete('region_index.mat');

    % 창 닫기
    close all;
end
