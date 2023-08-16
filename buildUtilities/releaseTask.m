function toolboxOptions = releaseTask(options)
%GENERATETOOLBOX Function that generates a toolbox for the boss device API

arguments
    options.toolboxVersion {mustBeTextScalar} = '0.0'
    options.authorName {mustBeTextScalar} = "MathWorks" % Use committer name when packaging from CI
end

% Get current project object
projObj = currentProject;

% Remove v from toolboxVersion
options.toolboxVersion = erase(options.toolboxVersion,"v");

% Toolbox Parameter Configuration
toolboxOptions = matlab.addons.toolbox.ToolboxOptions(fullfile(projObj.RootFolder,"toolbox"), "Message-De-Serializer-for-ROS");

toolboxOptions.ToolboxName = projObj.Name;
toolboxOptions.ToolboxVersion = options.toolboxVersion;
toolboxOptions.Summary = projObj.Description;
% toolboxOptions.Description = projObj.Description;
toolboxOptions.AuthorName = options.authorName;
toolboxOptions.AuthorEmail = "promero@mathworks.com";
toolboxOptions.AuthorCompany = "MathWorks";
% toolboxOptions.ToolboxGettingStartedGuide = fullfile(projObj.RootFolder,"toolbox/gettingStarted.mlx");

if ~exist(fullfile(projObj.RootFolder,"releases"), 'dir')
   mkdir(fullfile(projObj.RootFolder,"releases"))
end
toolboxOptions.OutputFile = fullfile(projObj.RootFolder,"releases/Message-De-Serializer-for-ROS-installer.mltbx");

toolboxOptions.MinimumMatlabRelease = "R2020b";
% toolboxOptions.MaximumMatlabRelease = "R2023a"; % Won't limit maximum MATLAB release
toolboxOptions.SupportedPlatforms.Glnxa64 = true;
toolboxOptions.SupportedPlatforms.Maci64 = true;
toolboxOptions.SupportedPlatforms.MatlabOnline = false;
toolboxOptions.SupportedPlatforms.Win64 = true;

% Generate toolbox
matlab.addons.toolbox.packageToolbox(toolboxOptions);

end