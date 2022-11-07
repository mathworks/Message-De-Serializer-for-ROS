import matlab.unittest.TestRunner;
import matlab.unittest.TestSuite;
import matlab.unittest.Verbosity;
import matlab.unittest.plugins.XMLPlugin;

projObj = currentProject;

suite = TestSuite.fromProject(projObj);

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);
runner.addPlugin(XMLPlugin.producingJUnitFormat(fullfile(projObj.RootFolder,'results.xml')));

results = runner.run(suite);
