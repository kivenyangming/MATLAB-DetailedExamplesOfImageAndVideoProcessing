function varargout = MainForm(varargin)
% MAINFORM MATLAB code for MainForm.fig
%      MAINFORM, by itself, creates a new MAINFORM or raises the existing
%      singleton*.
%
%      H = MAINFORM returns the handle to a new MAINFORM or the handle to
%      the existing singleton*.
%
%      MAINFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFORM.M with the given input arguments.
%
%      MAINFORM('Property','Value',...) creates a new MAINFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainForm

% Last Modified by GUIDE v2.5 29-Dec-2013 17:16:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MainForm_OpeningFcn, ...
    'gui_OutputFcn',  @MainForm_OutputFcn, ...
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


% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainForm (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;
handles.Img1 = 0;
handles.Img2 = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainForm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FileOpen_Callback(hObject, eventdata, handles)
% hObject    handle to FileOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ��
warning off all;
% ����ͼ��
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.gif', ...
    '����ͼ���ļ�';...
    '*.*','�����ļ�' },'����ͼ��',...
    '.\images\\sweden_input.jpg');
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
InitFig(hObject, handles);
Img1 = imread(fullfile(PathName, FileName));
axes(handles.axes1);
imshow(Img1, []);
handles.Img1 = Img1;
handles.Img2 = 0;
guidata(hObject, handles);

% --------------------------------------------------------------------
function Exist_Callback(hObject, eventdata, handles)
% hObject    handle to Exist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('ͼ��ȥ��ϵͳ��ȫ�ּ��ֲ�ֱ��ͼ���⻯�ͻ���RETINEX����ȥ���㷨', '��ʾ��Ϣ');

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


% --------------------------------------------------------------------
function ImageDeFog_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDeFog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ColorSpaceDeFog_Callback(hObject, eventdata, handles)
% hObject    handle to ColorSpaceDeFog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RetinexDeFog_Callback(hObject, eventdata, handles)
% hObject    handle to RetinexDeFog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img1, 0)
    msgbox('������ͼ��', '��ʾ��Ϣ');
    return;
end
Img2 = RemoveFogByRetinex(handles.Img1, 0);
axes(handles.axes2); imshow(Img2, []);
handles.Img2 = Img2;
guidata(hObject, handles);
set(handles.textInfo, 'String', ...
    '����RETINEX����ȥ���㷨��');


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Flow_Callback(hObject, eventdata, handles)
% hObject    handle to Flow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = 'ͼ��ȥ��ϵͳ����������ͼ����ʾ��Ȼ��ѡ��ȥ���㷨�������Թ۲�ֱ��ͼ�Ա�Ч����';
msgbox(str, '��ʾ��Ϣ');

% --------------------------------------------------------------------
function SaveGUI_Callback(hObject, eventdata, handles)
% hObject    handle to SaveGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ��ͼ
SnapImage();


% --------------------------------------------------------------------
function SaveResult_Callback(hObject, eventdata, handles)
% hObject    handle to SaveResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ����
if isequal(handles.Img2, 0)
    msgbox('�����ȥ����', '��ʾ��Ϣ');
    return;
end
SaveImage(handles.Img2);


% --------------------------------------------------------------------
function HistImg_Callback(hObject, eventdata, handles)
% hObject    handle to HistImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ֱ��ͼ�Ա�
if isequal(handles.Img1, 0)
    msgbox('������ͼ��', '��ʾ��Ϣ');
    return;
end
if isequal(handles.Img2, 0)
    msgbox('�����ȥ����', '��ʾ��Ϣ');
    return;
end
figure('Name', 'ֱ��ͼ�Ա�', 'NumberTitle', 'Off', ...
    'Units', 'Normalized', 'Position', [0.1 0.1 0.5 0.5]);
subplot(2, 2, 1); imshow(handles.Img1); title('ԭͼ��', 'FontWeight', 'Bold');
subplot(2, 2, 2); imshow(handles.Img2); title('������ͼ��', 'FontWeight', 'Bold');
Q = rgb2gray(handles.Img1);
W = rgb2gray(handles.Img2);
subplot(2, 2, 3); imhist(Q, 64); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
subplot(2, 2, 4); imhist(W, 64); title('�����ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');


% --------------------------------------------------------------------
function GlobalHisteq_Callback(hObject, eventdata, handles)
% hObject    handle to GlobalHisteq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img1, 0)
    msgbox('������ͼ��', '��ʾ��Ϣ');
    return;
end
Img2 = RemoveFogByGlobalHisteq(handles.Img1, 0);
axes(handles.axes2); imshow(Img2, []);
handles.Img2 = Img2;
guidata(hObject, handles);
set(handles.textInfo, 'String', ...
    'ȫ��ֱ��ͼ���⻯ʵ��ͼ��ȥ���㷨��');

% --------------------------------------------------------------------
function LocalHisteq_Callback(hObject, eventdata, handles)
% hObject    handle to LocalHisteq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img1, 0)
    msgbox('������ͼ��', '��ʾ��Ϣ');
    return;
end
Img2 = RemoveFogByLocalHisteq(handles.Img1, 0);
axes(handles.axes2); imshow(Img2, []);
handles.Img2 = Img2;
guidata(hObject, handles);
set(handles.textInfo, 'String', ...
    '�ֲ�ֱ��ͼ���⻯ʵ��ͼ��ȥ���㷨��');
