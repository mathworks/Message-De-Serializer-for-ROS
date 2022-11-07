classdef slrtBuildTests < matlab.unittest.TestCase

    properties (TestParameter)
        model = {'message_ros2_deserialize_receive_slrt','message_ros2_serialize_send_slrt'};
    end

    methods (Test)
        % Test methods
        function slrtBuild(testCase, model)
            testCase.verifyWarningFree(@() slbuild(model));
        end
    end

end