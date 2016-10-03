
function varargout = AnnotationToolBoundingBox(varargin)
% ANNOTATIONTOOLBOUNDINGBOX MATLAB code for AnnotationToolBoundingBox.fig
%      ANNOTATIONTOOLBOUNDINGBOX, by itself, creates a new ANNOTATIONTOOLBOUNDINGBOX or raises the existing
%      singleton*.
%
%      H = ANNOTATIONTOOLBOUNDINGBOX returns the handle to a new ANNOTATIONTOOLBOUNDINGBOX or the handle to
%      the existing singleton*.
%
%      ANNOTATIONTOOLBOUNDINGBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANNOTATIONTOOLBOUNDINGBOX.M with the given input arguments.
%
%      ANNOTATIONTOOLBOUNDINGBOX('Property','Value',...) creates a new ANNOTATIONTOOLBOUNDINGBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AnnotationToolBoundingBox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AnnotationToolBoundingBox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AnnotationToolBoundingBox

% Last Modified by GUIDE v2.5 03-Oct-2016 17:52:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AnnotationToolBoundingBox_OpeningFcn, ...
                   'gui_OutputFcn',  @AnnotationToolBoundingBox_OutputFcn, ...
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


% --- Executes just before AnnotationToolBoundingBox is made visible.
function AnnotationToolBoundingBox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AnnotationToolBoundingBox (see VARARGIN)

% Choose default command line output for AnnotationToolBoundingBox
handles.output = hObject;

% Update handles structure
global index;
set(handles.axes1,'xtick',[],'ytick',[]);
set(handles.axes1, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8]);
path = getappdata(0,'path');

images = getAllFiles(path);
handles.images = images;
index = 1;
imshow(imread(images{index}),'Parent',handles.axes1);
guidata(hObject, handles);
% UIWAIT makes AnnotationToolBoundingBox wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function fileList = getAllFiles(dirName)

  dirData = dir(dirName);      %# Get the data for the current directory
  dirIndex = [dirData.isdir];  %# Find the index for directories
  fileList = {dirData(~dirIndex).name}';  %'# Get a list of the files
  if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(dirName,x),...  %# Prepend path to files
                       fileList,'UniformOutput',false);
  end
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    fileList = [fileList; getAllFiles(nextDir)];  %# Recursively call getAllFiles
  end



    
% --- Outputs from this function are returned to the command line.
function varargout = AnnotationToolBoundingBox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Close.
   button = questdlg('Going back will not save your current task..',...
       'Alert',...
       'Ok','Cancel','Cancel');
   switch button
       case 'Ok'
           sprintf('dddd')
           closereq;
           AnnotationTool;
       
   end
   
   


function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;

% --- Executes on button press in Undo.
function Undo_Callback(hObject, eventdata, handles)
% hObject    handle to Undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Preview.
function Preview_Callback(hObject, eventdata, handles)
% hObject    handle to Preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when uibuttongroup1 is resized.
function uibuttongroup1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global index; 
    %get(handles.current_index)
    index = index + 1;
    imshow(handles.images{index},'Parent',handles.axes1);
    
   
     


% --- Executes on button press in previous.
function previous_Callback(hObject, eventdata, handles)
% hObject    handle to previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index; 
if index <=1
    msgbox('You are at the first Image');
else
    %get(handles.current_index)
    index = index - 1;
    
    imshow(handles.images{index},'Parent',handles.axes1);
end
