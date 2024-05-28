function varargout = run(varargin)
% RUN MATLAB code for run.fig
%      RUN, by itself, creates a new RUN or raises the existing
%      singleton*.
%
%      H = RUN returns the handle to a new RUN or the handle to
%      the existing singleton*.
%
%      RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN.M with the given input arguments.
%
%      RUN('Property','Value',...) creates a new RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help run

% Last Modified by GUIDE v2.5 13-Aug-2018 00:13:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @run_OpeningFcn, ...
                   'gui_OutputFcn',  @run_OutputFcn, ...
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


% --- Executes just before run is made visible.
function run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to run (see VARARGIN)

% Choose default command line output for run
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clear all;
close all;
clc;
FaceState=['AN';'DI';'FE';'HA';'NE';'SA';'SU';]; % i
 PersonName=['KA';'KL';'KM';'KR';'MK';'NA';'NM';'TM';'UY';'YM';];  % j

Col=1;
for i=1:7
    
    PerName='';
    for j=1:10
       
        cd ('C:\Users\computer\Documents\MATLAB\facial Expression Recognition\trainset\');
        AllFile=dir('*.TIF');
        cc=1;        
        for ll=1:length(AllFile(:,1))
            TotalName(ll,1:length(AllFile(ll,1).name))=AllFile(ll,1).name;        
            if (strfind(TotalName(ll,:),FaceState(i,:)))
                if  (strfind(TotalName(ll,:),PersonName(j,:)))
                   PerName(cc,1:length(TotalName(ll,:)))=TotalName(ll,:);
                   cc=cc+1;
                end                
            end
        end

  
     cd ('C:\Users\computer\Documents\MATLAB\facial Expression Recognition');
 for k=1:length(PerName(:,1))
         h=imread(strcat('C:\Users\computer\Documents\MATLAB\facial Expression Recognition\trainset\',PerName(k,:)));
               
h=imresize(h,[50 50]);
h1=h(1:25,1:25);
h2=h(1:25,25:50);
h3=h(25:50,1:25);
h4=h(25:50,25:50);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % gabor 
norient=6;
mul=2;
for DWScale=0:2
   t1(DWScale+1).data=GabFilter(h1,DWScale,norient,0,mul,0.65,1.5)
   t2(DWScale+1).data=GabFilter(h2,DWScale,norient,0,mul,0.65,1.5);
   t3(DWScale+1).data=GabFilter(h3,DWScale,norient,0,mul,0.65,1.5);
   t4(DWScale+1).data=GabFilter(h4,DWScale,norient,0,mul,0.65,1.5);
 
           
end

fv=FeatureVector(t1,t2,t3,t4);

e3=fv;
 save('e3.mat','e3');

 
[COEFF,SCORE] = princomp(zscore(e3)');
 SCORE=SCORE';
 save('SCORE.mat','SCORE');
FVTrain(Col,1:100)= SCORE(1,1:100);
  fv24(Col,1)=i;
 Col=Col+1;
  end 
    end 
end

  save('fv24.mat','fv24');

 for iii=1:167
     
     FVTrain(iii,101)=fv24(iii,1);
    
     
 end
 
  x=FVTrain(:,1:100);
y=FVTrain(:,101);
 save('FVTrain1.mat','x','y');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
[FileName, PathName] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'Select an Image');
fpath = strcat(PathName, FileName);
h = imread(fpath);
axes(handles.axes1) % Select the proper axes
box on
imshow(h);
save('h.mat','h');
h=imresize(h,[50 50]);
h1=h(1:25,1:25);
h2=h(1:25,25:50);
h3=h(25:50,1:25);
h4=h(25:50,25:50);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % gabor 
norient=6;
mul=2;
for DWScale=0:2
   t1(DWScale+1).data=GabFilter(h1,DWScale,norient,0,mul,0.65,1.5);
   t2(DWScale+1).data=GabFilter(h2,DWScale,norient,0,mul,0.65,1.5);
   t3(DWScale+1).data=GabFilter(h3,DWScale,norient,0,mul,0.65,1.5);
   t4(DWScale+1).data=GabFilter(h4,DWScale,norient,0,mul,0.65,1.5);
 
           
end
figure; showimg(t1);
figure; showimg(t2);
figure; showimg(t3);
figure; showimg(t4);
fv=FeatureVector(t1,t2,t3,t4);
 save('fv.mat','fv');
e5=fv;
 
[COEFF,SCORE] = princomp(zscore(e5)');
 SCORE=SCORE';
 save('SCORE.mat','SCORE');
FVTest(1,1:100)= SCORE(1,1:100);

   FVTest(1,101)=1;

  x1=FVTest(:,1:100);
y1=FVTest(:,101);
 save('FVTest1.mat','x1','y1');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   P network
% load('FVTrain1.mat','x','y');
% load('FVTest1.mat','x1','y1');
% p=x;
% Tc=y';
% % Tc = [1 2 3 2 2 3 1];
% T = ind2vec(Tc);
% 
% net = newpnn(p',T);
% % p1=[ 3 5];
% load('FVTest1.mat','x1','y1');
% p1=x1;
% Y = sim(net,p1')
% Class = vec2ind(Y)

% % % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%% % % RBF network
load('FVTrain1.mat','x','y');
load('FVTest1.mat','x1','y1');
p=x;
Tc=y';
% Tc = [1 2 3 2 2 3 1];
T = ind2vec(Tc);
[net]=newrb(p',T,0,10,193,25);
p1=x1;
[Y]= sim(net,p1');
Class = vec2ind(Y)


 if (Class==1)
      set(handles.text1,'String','Angry');
 end
 if (Class==2)
      set(handles.text1,'String','Digust');
 end
  if (Class==3)
      set(handles.text1,'String','fear');
  end
  if (Class==4)
      set(handles.text1,'String','happy');
  end
   if (Class==5)
      set(handles.text1,'String','neutral');
   end
   if (Class==6)
      set(handles.text1,'String','sadness');
   end
   if (Class==7)
      set(handles.text1,'String','suprize');
 end
