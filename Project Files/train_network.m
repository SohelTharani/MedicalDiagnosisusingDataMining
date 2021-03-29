function varargout = train_network(varargin)
% TRAIN_NETWORK M-file for train_network.fig

%      H = TRAIN_NETWORK returns the handle to a new TRAIN_NETWORK or the handle to
%      the existing singleton*.

%      TRAIN_NETWORK('Property','Value',...) creates a new TRAIN_NETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before train_network_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to train_network_OpeningFcn via varargin.

% Last Modified by GUIDE v2.5 30-Mar-2019 20:38:55


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @train_network_OpeningFcn, ...
    'gui_OutputFcn',  @train_network_OutputFcn, ...
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


% --- Executes just before train_network is made visible.
function train_network_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for train_network
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = train_network_OutputFcn(hObject, eventdata, handles)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
maingui

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
maingui;



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

handles.output = hObject;
M = csvread('Book1.csv');



M=normalize_data(M);
save M;
for ii=1:length(M)
    data_to_train(ii,1)=M(ii,1);
    data_to_train(ii,2)=M(ii,2);
    data_to_train(ii,3)=M(ii,3);
    data_to_train(ii,4)=M(ii,4);
    data_to_train(ii,5)=M(ii,5);
    data_to_train(ii,6)=M(ii,6);
    data_to_train(ii,7)=M(ii,7);
    data_to_train(ii,8)=M(ii,8);
    data_to_train(ii,9)=M(ii,9);
    data_to_train(ii,10)=M(ii,10);
    data_to_train(ii,11)=M(ii,11);
    data_to_train(ii,12)=M(ii,12);
    data_to_train(ii,13)=M(ii,13);
    data_to_train(ii,14)=M(ii,14);
    
end


b=data_to_train(1:length(M),1:13);
Input=b';
Output=data_to_train(1:length(M),14)';


for ii=1:1:13
    val= findminmax(Input(ii,1:length(M)));
    RS(ii,1)=val(1,1);
    RS(ii,2)=val(1,2);
end

ep = load('myfile.mat');


epchs = ep.epochs;
trn_fn = ep.transfer_fn;

if ep.layer == 3
    S=[13 10 1];
[trainV, valV, testV] = dividevec(Input, Output, 0.10, 0.10);

    net=newff(RS,S,{trn_fn,trn_fn, trn_fn});
else
    S=[13 1];
[trainV, valV, testV] = dividevec(Input, Output, 0.10);

    net=newff(RS,S,{trn_fn,trn_fn});
end

net.trainParam.epochs = epchs;
[net,tr,Y,E,Pf,Af]=train(net,Input,Output);
save  net
save  net1
mean_error=tr.perf;
No_of_epoch=tr.epoch;

h=findobj('Type','axes','Tag','axes6');
axes(h)
% axes(handles)
for ii=2:5:length(No_of_epoch)
    epoch(ii)=No_of_epoch(ii);
    MSE(ii)=mean_error(ii);
end
plot(epoch,MSE,'-r*')

%%%PLOT CONFUSION%%%%%%


test_M = csvread('test.csv');

test_M=normalize_data(test_M);
save test_M;
for ii=1:length(test_M)
    data_to_test(ii,1)=test_M(ii,1);
    data_to_test(ii,2)=test_M(ii,2);
    data_to_test(ii,3)=test_M(ii,3);
    data_to_test(ii,4)=test_M(ii,4);
    data_to_test(ii,5)=test_M(ii,5);
    data_to_test(ii,6)=test_M(ii,6);
    data_to_test(ii,7)=test_M(ii,7);
    data_to_test(ii,8)=test_M(ii,8);
    data_to_test(ii,9)=test_M(ii,9);
    data_to_test(ii,10)=test_M(ii,10);
    data_to_test(ii,11)=test_M(ii,11);
    data_to_test(ii,12)=test_M(ii,12);
    data_to_test(ii,13)=test_M(ii,13);
    data_to_test(ii,14)=test_M(ii,14);    
end
b_test=data_to_test(1:length(test_M),1:13);
Input_test=b_test';
Output_target=data_to_test(1:length(test_M),14)';
%[net,tr]=train(net,Input,Output);
    for ii=1:length(test_M)
        Optga(ii)=(sim(net,Input_test(1:13,ii)));
  
   O = double(uint64(Optga(ii)))
if O == 1
    Result_predicted(ii)=1;
else
    Result_predicted(ii)=0;
end
  end


%plotperform(tr)

[c,cm,ind,per] = confusion(Output_target,Result_predicted)
figure (2);

subplot(2,1,1)
plotconfusion(Output_target, Result_predicted)

% test_data

% Choose default command line output for train_network
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)





