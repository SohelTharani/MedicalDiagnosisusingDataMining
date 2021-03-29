function varargout = plot_error(varargin)

%      PLOT_ERROR('Property','Value',...) creates a new PLOT_ERROR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot_error_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot_error_OpeningFcn via varargin.

% Edit the above text to modify the response to help plot_error

% Last Modified by GUIDE v2.5 31-Mar-2019 20:54:23

% Begin initialization code - DO NOT EDIT
global mse_error2 mse_error1
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @plot_error_OpeningFcn, ...
    'gui_OutputFcn',  @plot_error_OutputFcn, ...
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


% --- Executes just before plot_error is made visible.
function plot_error_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for plot_error
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = plot_error_OutputFcn(hObject, eventdata, handles)


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

global mse_error2 mse_error1
 load mse_error1;
 load mse_error2;

h=findobj('Type','axes','Tag','axes1');
handles.axes1=h;
axes(h)

plot(mse_error1,'-k.');
hold on
plot(mse_error2,'-r*');
legend('error after ga','error before ga')


h=findobj('Type','axes','Tag','axes2');
handles.axes2=h;
axes(h)

generations=[10 20 30 40 50 60 70 80 90 100 ];
mean_mse_generations=[0.0002,0.0003,0.0003,0.0003,0.0003,0.0003,0.0003,0.0004,0.0004,0.0004;]

 h=findobj('Type','axes','Tag','axes2');
 axes(h)

 plot(mean_mse_generations,generations,'-k.');

title('Variance in Generations');
ylabel('Generations')
xlabel('MEAN MSE')




guidata(hObject, handles);





% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)



