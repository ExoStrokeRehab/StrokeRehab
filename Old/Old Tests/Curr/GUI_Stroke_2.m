function varargout = GUI_Stroke_2(varargin)
% GUI_STROKE_2 MATLAB code for GUI_Stroke_2.fig
%      GUI_STROKE_2, by itself, creates a new GUI_STROKE_2 or raises the existing
%      singleton*.
%
%      H = GUI_STROKE_2 returns the handle to a new GUI_STROKE_2 or the handle to
%      the existing singleton*.
%
%      GUI_STROKE_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_STROKE_2.M with the given input arguments.
%
%      GUI_STROKE_2('Property','Value',...) creates a new GUI_STROKE_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Stroke_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Stroke_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Stroke_2

% Last Modified by GUIDE v2.5 11-Aug-2015 11:58:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Stroke_2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Stroke_2_OutputFcn, ...
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


% --- Executes just before GUI_Stroke_2 is made visible.
function GUI_Stroke_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Stroke_2 (see VARARGIN)

% Choose default command line output for GUI_Stroke_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
connector on Stroke;
handles.m = mobiledev;
handles.LoggingTimeAns = '';
handles.GraphOption = 1;
handles.PlotOption = 1;
handles.TableOption = 1;
handles.ArmOption = 1;
handles.InstanceState = 0;
handles.TimeIndex = 1;
handles.LoggingSize = 0;
handles.LoggingInit = 1;
guidata(hObject, handles);



% UIWAIT makes GUI_Stroke_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Stroke_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LeftArmPushbutton.
function LeftArmPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to LeftArmPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if isempty(handles.LoggingTimeAns)
    warndlg('Time Duration Input must be enterd');
else
    if isempty(str2double(handles.LoggingTimeAns)) || str2double(handles.LoggingTimeAns) <= 0
        set(src,'string','0');
        warndlg('Time Duration Input must numerical and greater than 0');
    else
        [handles.LoggingSize, handles.LoggingInit] = FullMotionCapture_v3_left(handles.m, str2double(handles.LoggingTimeAns), handles.LoggingSize, handles.LoggingInit);
    end
end
guidata(hObject, handles);


% --- Executes on button press in RightArmPushbutton.
function RightArmPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to RightArmPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isempty(handles.LoggingTimeAns)
    warndlg('Time Duration Input must be enterd');
else
    if isempty(str2double(handles.LoggingTimeAns)) || str2double(handles.LoggingTimeAns) <= 0
        set(src,'string','0');
        warndlg('Time Duration Input must numerical and greater than 0');
    else
        [handles.LoggingSize, handles.LoggingInit] = FullMotionCapture_v3_right(handles.m, str2double(handles.LoggingTimeAns), handles.LoggingSize, handles.LoggingInit);
    end
end
guidata(hObject, handles);




% --- Executes on button press in GraphButton.
function GraphButton_Callback(hObject, eventdata, handles)
% hObject    handle to GraphButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Regular-LeftArm-NoInstance
if handles.GraphOption == 1 && handles.ArmOption == 1 && handles.InstanceState == 0
    Regular_Left_NoInstance_CSVRead()
elseif handles.GraphOption == 1 && handles.ArmOption == 2 && handles.InstanceState == 0
    Regular_Right_NoInstance_CSVRead()
elseif handles.GraphOption == 1 && handles.ArmOption == 3 && handles.InstanceState == 0
    Regular_Both_NoInstance_CSVRead()
elseif handles.GraphOption == 1 && handles.ArmOption == 1 && handles.InstanceState == 1
    Regular_Left_Instance_CSVRead()
elseif handles.GraphOption == 1 && handles.ArmOption == 2 && handles.InstanceState == 1
    Regular_Right_Instance_CSVRead()
elseif handles.GraphOption == 1 && handles.ArmOption == 3 && handles.InstanceState == 1
    Regular_Both_Instance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 1 && handles.InstanceState == 0
    Min_Max_Left_NoInstance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 2 && handles.InstanceState == 0
    Min_Max_Right_NoInstance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 3 && handles.InstanceState == 0
    Min_Max_Both_NoInstance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 1 && handles.InstanceState == 1
    Min_Max_Left_Instance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 2 && handles.InstanceState == 1
    Min_Max_Right_Instance_CSVRead()
elseif handles.GraphOption == 2 && handles.ArmOption == 3 && handles.InstanceState == 1
    Min_Max_Both_Instance_CSVRead()
end



% --- Executes on button press in PlotButton.
function PlotButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TimeIndexButton.
function TimeIndexButton_Callback(hObject, eventdata, handles)
% hObject    handle to TimeIndexButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.TimeIndex)
    warndlg('Please enter a time index');
elseif isempty(str2double(handles.LoggingTimeIndex))
    warndlg('Please enter an integer')
elseif round(str2double(handles.LoggingTimeIndex)) <= 0
    warndlg('Please enter an appropriate integer time index greater than 0');
else
    handles.LoggingTimeIndex = round(str2double(handles.LoggingTimeIndex));
end
    
guidata(hObject, handles);


% --- Executes on button press in InstancesToggle.
function InstancesToggle_Callback(hObject, eventdata, handles)
% hObject    handle to InstancesToggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InstancesToggle
handles.InstanceState = get(hObject, 'Value');
guidata(hObject,handles);




function Duration_Callback(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Duration as text
%        str2double(get(hObject,'String')) returns contents of Duration as a double

handles.LoggingTimeAns=get(hObject,'String');
if isempty(str2double(get(hObject,'String')))
    set(hObject,'string','0');
    warndlg('Input must be numerical');
elseif str2double(get(hObject,'String')) <= 0
    warndlg('Input must be greater than 0')
else
    handles.LoggingTimeAns=get(hObject,'String');
end
handles.LoggingSize = 0;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in TableDataButton.
function TableDataButton_Callback(hObject, eventdata, handles)
% hObject    handle to TableDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in CSVDisplay.
function CSVDisplay_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to CSVDisplay (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in ArmTypeMenu.
function ArmTypeMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ArmTypeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ArmTypeMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ArmTypeMenu
contents = cellstr(get(hObject,'String'));
handles.ArmOption = contents{get(hObject,'Value')};
if strcmp(handles.ArmOption, 'Left Arm')
    handles.ArmOption = 1;
elseif strcmp(handles.ArmOption, 'Right Arm')
    handles.ArmOption = 2;
elseif strcmp(handles.ArmOption, 'Superimposed Both')
    handles.ArmOption = 3;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ArmTypeMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ArmTypeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LeftArmPushbutton_CreateFcn(hObject, eventdata, handles)

function RightArmPushbutton_CreateFcn(hObject, eventdata, handles)


% --- Executes on selection change in GraphMenu.
function GraphMenu_Callback(hObject, eventdata, handles)
% hObject    handle to GraphMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GraphMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GraphMenu
contents = cellstr(get(hObject,'String'));
handles.GraphOption = contents{get(hObject,'Value')};
if strcmp(handles.GraphOption, 'Regular Motion')
    handles.GraphOption = 1;
elseif strcmp(handles.GraphOption, 'Min and Max Motion')
    handles.GraphOption = 2;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function GraphMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GraphMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TableMenu.
function TableMenu_Callback(hObject, eventdata, handles)
% hObject    handle to TableMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns TableMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TableMenu
contents = cellstr(get(hObject,'String'));
handles.TableOption = contents{get(hObject,'Value')};
if strcmp(handles.TableOption,'Left Arm Data')
    handles.TableOption = 1;
elseif strcmp(handles.TableOption,'Left Arm Min and Max')
    handles.TableOption = 2;
elseif strcmp(handles.TablesOption,'Right Arm Data')
    handles.TableOption = 3;
elseif strcmp(handles.TableOption,'Right Arm Min and Max')
    handles.TableOption = 4;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function TableMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TableMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PlotMenu.
function PlotMenu_Callback(hObject, eventdata, handles)
% hObject    handle to PlotMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PlotMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PlotMenu
contents = cellstr(get(hObject, 'String'));
handles.PlotOption = contents{get(hObject,'Value')};
if strcmp(handles.PlotOption,'Phi Angle Plot')
    handles.PlotOption = 1;
elseif strcmp(handles.PlotOption,'Theta Angle Plot')
    handles.PlotOption = 2;
elseif strcmp(handles.PlotOption,'Both Phi and Theta Angle Plot')
    handles.PlotOption = 3;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function PlotMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TimeIndex_Callback(hObject, eventdata, handles)
% hObject    handle to TimeIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TimeIndex as text
%        str2double(get(hObject,'String')) returns contents of TimeIndex as a double

handles.TimeIndex = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function TimeIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TimeIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
