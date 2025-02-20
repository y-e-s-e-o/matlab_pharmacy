function varargout = open_window(varargin)
% OPEN_WINDOW MATLAB code for open_window.fig
%      OPEN_WINDOW, by itself, creates a new OPEN_WINDOW or raises the existing
%      singleton*.
%
%      H = OPEN_WINDOW returns the handle to a new OPEN_WINDOW or the handle to
%      the existing singleton*.
%
%      OPEN_WINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPEN_WINDOW.M with the given input arguments.
%
%      OPEN_WINDOW('Property','Value',...) creates a new OPEN_WINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before open_window_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to open_window_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help open_window

% Last Modified by GUIDE v2.5 27-Nov-2024 22:03:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @open_window_OpeningFcn, ...
                   'gui_OutputFcn',  @open_window_OutputFcn, ...
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


% --- Executes just before open_window is made visible.
function open_window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to open_window (see VARARGIN)

% Choose default command line output for open_window
handles.output = hObject;

% 반복 실행일 경우
if exist('update_state.mat')

    load('update_state.mat');

    % 파일만 변경할 경우
    if option == 1
        % 파일 데이터는 지우기
        delete('filename.mat');
        delete('filepath.mat');

        % 지역은 기존 데이터 사용
        load('region.mat');
        handles.region = region;

        % popupmenu에 뜨는 지역이 전에 선택된 지역으로 유지되도록
        load('region_index.mat');
        handles.region_index = region_index;
        set(handles.popupmenu_region, 'Value', handles.region_index);

    % 지역만 변경할 경우
    elseif option == 2
        % 지역 데이터는 지우기
        delete('region.mat');
        delete('region_index.mat');
        
        % 사용자가 지역값을 따로 선택하지 않고, 서울로 놔두고 검색할 경우
        % 첫 번째 항목("서울")을 기본값으로 설정
        contents = cellstr(get(handles.popupmenu_region, 'String'));
        handles.region_index = get(handles.popupmenu_region, 'Value');
        handles.region = contents{handles.region_index};

        % 파일은 기존 데이터 사용
        load('filename.mat');
        load('filepath.mat');
        handles.filename = filename;
        handles.filepath = filepath;

    else
        % 파일, 지역 데이터 모두 지우기
        delete('filename.mat');
        delete('filepath.mat');
        delete('region.mat');
        delete('region_index.mat');

        % 사용자가 지역값을 따로 선택하지 않고, 서울로 놔두고 검색할 경우
        % 첫 번째 항목("서울")을 기본값으로 설정
        contents = cellstr(get(handles.popupmenu_region, 'String'));
        handles.region_index = get(handles.popupmenu_region, 'Value');
        handles.region = contents{handles.region_index};

    end

% 처음 실행일 경우
else
    % 사용자가 지역값을 따로 선택하지않고, 서울로 놔두고 검색할 경우
    % 첫 번째 항목("서울")을 기본값으로 설정
    contents = cellstr(get(handles.popupmenu_region, 'String'));
    handles.region_index = get(handles.popupmenu_region, 'Value');
    handles.region = contents{handles.region_index};

end


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes open_window wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = open_window_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_upload_file.
function pushbutton_upload_file_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_upload_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[handles.filename, handles.filepath] = uigetfile('*.txt');

guidata(hObject, handles);


% --- Executes on selection change in popupmenu_region.
function popupmenu_region_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_region (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_region contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_region

% 팝업 메뉴 항목 읽기
contents = cellstr(get(hObject, 'String'));

% 지역 읽어들이기
handles.region_index = get(hObject, 'Value');
handles.region = contents{handles.region_index};

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_region_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_region (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Value', 1);


guidata(hObject, handles);

% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
filepath = handles.filepath;
region = handles.region;
region_index = handles.region_index;

save('filename', 'filename');
save('filepath', "filepath");
save('region', "region");
save('region_index', 'region_index');

pharmacy_app()


guidata(hObject, handles);
