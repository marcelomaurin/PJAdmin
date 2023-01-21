; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "PJ"
#define MyAppVersion "0.04"
#define MyAppPublisher "maurinsoft"
#define MyAppURL "http://maurinsoft.com.br"
#define MyAppExeName "PJ.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{15E35126-C8B9-4A31-BC71-1986AF91FAD1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=PJ_setup_00
Compression=lzma
SolidCompression=yes

 

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked


[Types]
Name: "Elgin"; Description:  {cm:T_Elgin}
Name: "Pos58"; Description: {cm:T_Pos58}
Name: "Pos5811"; Description: {cm:T_Pos5811}
Name: "PJ"; Description: {cm:T_PJ}
Name: "L42PRO"; Description: {cm:T_L42PRO}

[Components]
Name: "File"; Description: "Arquivos do PJ"; Types: PJ;
Name: "Elgin"; Description: "Instala��o do PJ com Elgin"; Types:  PJ  Elgin;
Name: "Pos58"; Description: "Instala��o do PJ com POS58"; Types:  PJ Pos58;
Name: "Pos5811"; Description: "Instala��o do PJ com POS5811"; Types:  PJ Pos5811;
Name: "L42PRO"; Description: "Instala��o do PJ com POS5811"; Types:  PJ ZEBRAL42PRO;
Name: "ZebraL42PRO"; Description: "Instala��o da Impressora Zebra com L42PRO"; Types:  PJ ZEBRAL42PRO;


[CustomMessages]
T_Elgin=Elgin
TD_Elgin=Instala��o padr�o do PJ com drivers do Elgin i9
T_Pos58=Pos
TD_Pos58=Instala��o padr�o do PJ com drivers do Pos58
T_Pos5811=Pos
TD_Pos5811=Instala��o padr�o do PJ com drivers do Pos5811
TD_PJ=Instala��o padr�o do PJ sem drivers do fabricante de impressora
T_PJ=Fila
TD_L42PRO=Instala��o padr�o do PJ sem drivers do fabricante de impressora L42PRO

; [Setup], [Files] etc sections go here
[Code]
#define MSIDT_CustomType "Whatever"
#include "DescriptiveTypes.isi"
procedure InitializeWizard();
begin
 InitializeDescriptiveTypes();
end;



[Files]
Source: "D:\projetos\maurinsoft\PJAdmin\src\Fila.exe"; DestDir: "{app}"; Flags: ignoreversion
;Source: "D:\projetos\maurinsoft\PJAdmin\cliente.cfg"; DestDir: "{app}"; 
Source: "D:\projetos\maurinsoft\PJAdmin\drivers\Elgin i9\ELGIN Printer Driver_v-1.6.6.exe"; DestDir: "{app}"; Components: Elgin ;
Source: "D:\projetos\maurinsoft\PJAdmin\drivers\POS58\POS Printer Driver Setup .exe"; DestDir: "{app}"; Components: Pos58;
Source: "D:\projetos\maurinsoft\PJAdmin\drivers\POS5811-DD\POS Printer Driver Setup .exe"; DestDir: "{app}"; Components: Pos5811;
Source: "D:\projetos\maurinsoft\PJAdmin\drivers\L42PRO\POS Printer Driver Setup .exe"; DestDir: "{app}"; Components: L42PRO;
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\ELGIN Printer Driver_v-1.6.6.exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Elgin;
Filename: "{app}\POS Printer Driver Setup .exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Pos58; 
Filename: "{app}\POS Printer Driver Setup .exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Pos5811; 
Filename: "{app}\POS Printer Driver Setup .exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: L42PRO; 
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
