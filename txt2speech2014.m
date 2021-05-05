% Program to do text to speech.
% Get user's sentence
%% Read OCR Image and convert into text and then Speak
oc = imread('ex1.png');         %Read OCR Imge
results = ocr(oc);        % Store the text as results
disp(results);            % display the results to output 
res = results.Text;      % Obtain only text from OCR results
disp(res)                % Display them to the Output

NET.addAssembly('System.Speech');                      % make assembly visible to MATLAB
obj = System.Speech.Synthesis.SpeechSynthesizer;       % Create an object where as "System.Speech" is assembly and "Synthesisi.SpeechSynthesizer" is class
obj.Volume = 100;                                      % You can aslo set the output Volume by obj.Volume Method
Speak(obj, res);                               % Finally pass obj and text as arguments to the Speak method to SPEAK OUT the text as output

%%  Read Text from the User Input Promt and then Speak 
userPrompt = 'What do you want the computer to say?';
titleBar = 'Text to Speech';
defaultString = 'Hello World!  MATLAB is an awesome program!';
caUserInput = inputdlg(userPrompt, titleBar, 1, {defaultString});
if isempty(caUserInput)
  return;
end                                            % Bail out if they clicked Cancel.
caUserInput = char(caUserInput);               % Convert from cell to string.

NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, caUserInput);

%% Change Voice 
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
voices = obj.GetInstalledVoices;
for i = 1 : voices.Count
    voice = Item(voices,i-1);
    voice.VoiceInfo.Name
end
   
%% Sources


% What is an assembly
% https://www.mathworks.com/help/matlab/matlab_external/an-assembly-is-a-library-of-net-classes.html
% Load a global net assembly
% https://www.mathworks.com/help/matlab/matlab_external/load-a-global-net-assembly.html?searchHighlight=System.Speech&s_tid=srchtitle
% how to create a warning dialog box
% https://www.mathworks.com/help/matlab/ref/warndlg.html?searchHighlight=warndlg&s_tid=srchtitle
% How to read OCR image
% https://www.mathworks.com/help/vision/ref/ocr.html?searchHighlight=OCR&s_tid=srchtitle
% How to Crop an Image
% https://www.mathworks.com/help/images/ref/imcrop.html?s_tid=doc_ta









