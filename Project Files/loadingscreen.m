function varargout = loadingscreen(varargin)
%      LOADINGSCREEN('Property','Value',...) creates a new LOADINGSCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before loadingscreen_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to loadingscreen_OpeningFcn via varargin.

% Last Modified by GUIDE v2.5 02-Apr-2019 16:50:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @loadingscreen_OpeningFcn, ...
                   'gui_OutputFcn',  @loadingscreen_OutputFcn, ...
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


% --- Executes just before loadingscreen is made visible.
function loadingscreen_OpeningFcn(hObject, eventdata, handles, varargin)

% handles call function indirectly
% Choose default command line output for loadingscreen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.axes4)
matlabImage = imread('logo.jpg');
image(matlabImage)
axis off
axis image

function varargout = loadingscreen_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


function text2_CreateFcn(hObject, eventdata, handles)

function pushbutton1_Callback(hObject, eventdata, handles)
val=get(handles.edit1,'String')   ;
val2=get(handles.edit2,'String')   ;

if strcmp(val, 'admin') && strcmp(val2, 'admin')
   create_network
else
    msgbox('Invalid Login'); 
end


function uipanel3_CreateFcn(hObject, eventdata, handles)


function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)



function edit2_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
