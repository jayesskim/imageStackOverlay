function varargout = imageStackOverlay(varargin)
% IMAGESTACKOVERLAY MATLAB code for imageStackOverlay.fig
%      IMAGESTACKOVERLAY, by itself, creates a new IMAGESTACKOVERLAY or raises the existing
%      singleton*.
%
%      H = IMAGESTACKOVERLAY returns the handle to a new IMAGESTACKOVERLAY or the handle to
%      the existing singleton*.
%
%      IMAGESTACKOVERLAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGESTACKOVERLAY.M with the given input arguments.
%
%      IMAGESTACKOVERLAY('Property','Value',...) creates a new IMAGESTACKOVERLAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageStackOverlay_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageStackOverlay_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageStackOverlay

% Last Modified by GUIDE v2.5 07-Jun-2017 15:50:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageStackOverlay_OpeningFcn, ...
                   'gui_OutputFcn',  @imageStackOverlay_OutputFcn, ...
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


% --- Executes just before imageStackOverlay is made visible.
function imageStackOverlay_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageStackOverlay (see VARARGIN)

% Choose default command line output for imageStackOverlay
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageStackOverlay wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imageStackOverlay_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% UPLOAD IMAGE 1
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file path filter_size size_thresh keep cmap
[file,path] = uigetfile({'*.tif;*.czi'},'Select your image stack:');
set(handles.edit1,'String',file)


% UPLOAD IMAGE 2
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file2 path2
[file2,path2] = uigetfile({'*.tif;*.czi'},'Select your image stack:');
set(handles.edit2,'String',file2)


% SLIDER
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

index = get(hObject,'Value');
set(handles.axes1,'CData',handles.original_stack{index});
% set(handles.axes1,'CData',handles.original_stack2{index});

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% UPLOAD IMAGE TEXT 1
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% UPLOAD IMAGE TEXT 2
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% OVERLAY
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file path filter_size size_thresh cmap file2 path2 cmap2
filter_size = get(handles.edit3,'String');
size_thresh = get(handles.edit4,'String');
filename = [path, file];
[original] = count_cells_overlay01(filename);
% Save the data from count_cells in the handles structure
handles.original_stack = original;

filename2 = [path2, file2];
[original2] = count_cells_overlay02(filename2);
handles.original_stack2 = original2;
for z = 1:length(original2)
mimg{z} = im2double(original2{z});
mim_rgb{z} = ind2rgb(round(mimg{z}.*size(cmap2,1)),cmap2);
end

% Display first image of stacks
axes(handles.axes1);
handles.axes1 = imshow(handles.original_stack{1},'ColorMap',cmap); %,'Parent',handles.imageDisplay);
hold on
h = image(mim_rgb{1}); a = 0.8;
set(h,'AlphaData',(mimg{1}>0).*a)

handles.axesfinal = 



% Update slider
set(handles.slider1,'Min',1,'Max',size(original,1),'SliderStep', ...
    [1 1]./(numel(original)-1),'Value',1);

% Update handles structure
guidata(hObject,handles);



% EXPORT FIGURE
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file
axes(handles.axes1);
ax = gca;
e_fig = figure;
copyobj(ax,e_fig);
roi_name = get(handles.edit5,'String');
fig_file = [file(1:end-4),'_',roi_name,'.fig'];
hgsave(e_fig,fig_file)


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
