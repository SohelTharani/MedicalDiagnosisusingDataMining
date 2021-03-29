function varargout = create_network(varargin)

%      H = CREATE_NETWORK returns the handle to a new CREATE_NETWORK or the handle to
%      the existing singleton*.
%
%      CREATE_NETWORK('Property','Value',...) creates a new CREATE_NETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_network_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_network_OpeningFcn via varargin.
%
% Last Modified by GUIDE v2.5 30-Mar-2019 19:37:59

% Begin initialization code - DO NOT EDIT
global Network_type epochs transfer_fn error_fn layer traning_fn



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @create_network_OpeningFcn, ...
    'gui_OutputFcn',  @create_network_OutputFcn, ...
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


function create_network_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = create_network_OutputFcn(hObject, eventdata, handles)

% Get default command line output from handles structure
varargout{1} = handles.output;



function popupmenu1_Callback(hObject, eventdata, handles)
% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.

function popupmenu4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
train_network

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
maingui


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)

global Network_type
val=get(handles.popupmenu6,'Value')   ;
if val==1
    Network_type='ff_network';
elseif val==2
    Network_type='cf_network';
else
    Network_type='eb_network';
end


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)


global layer
val1=get(handles.popupmenu7,'String');
val = val1{get(handles.popupmenu7,'Value')};
val = str2double(val);
if val==2
    layer=2;
else
    layer=3;
end

% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

global epochs
epochs=get(handles.edit2_Callback,'Value')   ;

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)

global transfer_fn

val=get(handles.popupmenu8,'String');
%val = val1{get(handles.popupmenu8,'Value')};



if val=='tansig'
    transfer_fn='tansig';
end

% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)

global traning_fn
val=get(handles.popupmenu9,'Value')   ;
if val==1
    traning_fn='trainlm';
elseif val==2
    traning_fn='trainbfg';
elseif val==3
    traning_fn='trainrp';
else
    traning_fn='trainrp';
end
% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)

global error_fn
val=get(handles.popupmenu10,'Value')   ;
if val==1
    error_fn='mse';
else
    error_fn='msearg';
end

% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)


global Network_type epochs transfer_fn error_fn layer traning_fn


save('myfile.mat','epochs', 'transfer_fn', 'layer');
%  save net
%  save epochs

train_network


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
loadingscreen

function popupmenu11_Callback(hObject, eventdata, handles)


global epochs
val1=get(handles.popupmenu11,'String');
val = val1{get(handles.popupmenu11,'Value')};
val = str2double(val);
if val==50
    epochs=50;
elseif val==100
    epochs=100;
elseif val==200
    epochs=200;
elseif val==300
    epochs=300;
elseif val==400
    epochs=400;
else epochs=500;
    
end



% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end