function varargout = maingui(varargin)

%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before maingui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to maingui_OpeningFcn via varargin.
% Last Modified by GUIDE v2.5 02-Mar-2019 21:07:54

% Begin initialization code - DO NOT EDIT

global sex Age Cholestrol BP chest_pain ECG heart_rate Physical_activity Diebetis Slope num_vessels Thal Result mse_error2 mse_error1
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @maingui_OpeningFcn, ...
                   'gui_OutputFcn',  @maingui_OutputFcn, ...
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


% --- Executes just before maingui is made visible.
function maingui_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for maingui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = maingui_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu1,'Value')   ;
if val==1
    sex=1;
else
    sex=0;
end
    

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.edit1,'String')   ;
x = str2double(val);
if x >= 20 && x <= 34
    Age=1;
elseif  x >= 35 && x <= 50
    Age=2;
elseif x>= 51 && x <= 60
    Age=3;

elseif x>= 61 && x <= 79
    Age=4;
    
elseif x >= 80 ;
    Age=5;
end    
    


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)


global sex Age Cholestrol BP Heridity Smoking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.edit3,'String')   ;
x = str2double(val);
if x < 120
    BP=-1;
elseif x > 120 && x <= 139
    BP=0;
elseif x >= 140
    BP=1;
end




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu2,'Value')   ;
if val==1
    BPT=1;
else
    BPT=2;
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

clear val
val=get(handles.popupmenu3,'Value')   ;
if val==1
    Physical_activity=1; %low
elseif val==2
    Physical_activity=2; %normal
else
    Physical_activity=3;%High
end




% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu4,'Value')   ;
if val==1
    Alcohol_intake=1;
else
    Alcohol_intake=2;
end

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu5,'Value')   ;
if val==1
    Somking=1;
else
    Somking=2;
end

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu6,'Value')   ;
if val==1
    Diebetis=1;
else
    Diebetis=2;
end

% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu7,'Value')   ;
if val==1
    Hereditry=1;
else
    Hereditry=2;
end


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu8,'Value')   ;
if val==1
    Obesity=1;
else
    Obesity=2;
end


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

val=get(handles.popupmenu9,'Value')   ;
if val==1
    Stress=1;
else
    Stress=2;
end


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress Result mse_error2 mse_error1

load M;
b=M(1:length(M),1:13);
I=b';
O=M(1:length(M),14)';
a=b';




load net


for ii=1:length(M)
    Opt(ii)=(sim(net,I(1:13,ii)));
end
mse_error1=calc_mse(Opt,O);


ep = load('myfile.mat');

epchs = ep.epochs;
trn_fn = ep.transfer_fn;

mse_error1=calc_mse(Opt,O);
    net=apply_ga(net,Opt,O);
 net.trainParam.epochs = epchs;

if ep.layer == 3
    S=[13 10 1];


    net=newff(RS,S,{trn_fn,trn_fn, trn_fn});
else
    S=[13 1];

    net=newff(RS,S,{trn_fn,trn_fn});
end

net.trainParam.epochs = epchs;


%net = newff(RS,S,{'tansig','tansig','purelin'});
% net=train(net,I);%,O(1:12)');
[net,tr]=train(net,Input,Output);
    for ii=1:length(M)
        Optga(ii)=(sim(net,I(1:13,ii)));
    end
    
mse_error2=calc_mse(Optga,O);


% h=findobj('Type','axes','Tag','axes6');
% axes(h)
% 
% plot(mse_error1,'-k.');
% hold on
% plot(mse_error2,'-r*');
% legend('error befor ga','error after ga')
% 

% load net
% data_to_train=[sex ;Age; Cholestrol; BP; Heridity; Smoking; Alcohol_intake ;Physical_activity; Diebetis; Diet; Obesity ;Stress];

data_to_train=[Age;sex; Cholestrol; BP; BPT; Hereditry; Somking; Alcohol_intake; Physical_activity; Diebetis; Diet; Obesity; Stress];

O1=sim(net,data_to_train)
O = double(uint64(O1))
if O == 1
    Result=1;
else
    Result=0;
end

h=findobj('Style','text','Tag','text16');
handles.text16=h;
 if Result==1
    Str1 = {'Heart Disease Present'};
set(handles.text16, 'String', Str1);
else
    Str2 = {'Heart Disease not Present'};
    set(handles.text16, 'String', Str2);
end

guidata(h, handles);


function edit8_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)


close all;

% --- Executes during object creation, after setting all properties.
function text15_CreateFcn(hObject, eventdata, handles)

text15.visible='on';



% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

plot_error



% --- Executes on button press in result_button.
function result_button_Callback(hObject, eventdata, handles)





% --- Executes on key press with focus on result_button and no controls selected.
function result_button_KeyPressFcn(hObject, eventdata, handles)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)




% --- Executes during object creation, after setting all properties.
function text16_CreateFcn(hObject, eventdata, handles)



% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress


clear val
val=get(handles.popupmenu10,'Value')   ;
if val==1
    Cholestrol=1; %low
elseif val==2
    Cholestrol=2; %normal
else
        Cholestrol=3;%High
end

% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

clear val
val=get(handles.popupmenu12,'Value')   ;
if val==1
    Diet=1; %low
elseif val==2
    Diet=2; %normal
else
    Diet=3;%High
end


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(hObject, eventdata, handles)

global sex Age Cholestrol BP BPT Hereditry Somking Alcohol_intake Physical_activity Diebetis Diet Obesity Stress

clear val
val=get(handles.popupmenu13,'Value')   ;
if val==1
    BP=1; %low
elseif val==2
    BP=2; %normal
else
    BP=3;%High
end

% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
