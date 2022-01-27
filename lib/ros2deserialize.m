classdef ros2deserialize < matlab.System & matlab.system.mixin.Propagates
    %rosdeserialize Deserialize a byte array into a ROS2 message
    %
    %   This system object deserializes a byte array into a ROS2 message.
    %   This object assumes that the byte array has been created by the
    %   rosserialize system object.
    %
    %   See also ros2serialize.
    %
    %   Copyright 2020 The MathWorks, Inc.
    
    %#codegen
    
    properties (Nontunable)
        MessageType = 'geometry_msgs/Point';
    end
    
    % These are the options for the dropdown lists
    % The properties are constant, hidden, and transient based on the
    % system object documentation
    properties (Constant, Hidden, Transient)
        %MessageTypeSet - Dropdown choices for ROS2 message type
        MessageTypeSet = matlab.system.StringSet(ros2("msg","list"));
    end
    
    methods
        function obj = rosdeserialize(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj, nargin, varargin{:});
        end
    end
    
    methods (Access = protected)
        function num = getNumInputsImpl(~)
            num = 3;
        end
        
        function num = getNumOutputsImpl(~)
            num = 1;
        end
        
        function outSizeBool = isOutputFixedSizeImpl(~)
            outSizeBool = true;
        end
        
        function outSize = getOutputSizeImpl(~)
            outSize = 1;
        end
        
        function isComplex = isOutputComplexImpl(~)
            isComplex = false;
        end
        
        function outType = getOutputDataTypeImpl(obj)
            [~, outType] = ros.slros2.internal.bus.Util.rosMsgTypeToDataTypeStr(obj.MessageType);
        end
        
        function Msg = stepImpl(~, Data, Length, BlankMsg)
            if Length > 0
                Msg = rosmsgUnpack(Data(1:Length), BlankMsg);
            elseif Length == -1
                s = size(Data);
                Msg = rosmsgUnpack(Data(1:s(1)), BlankMsg);
            else
                Msg = BlankMsg;
            end
        end
    end
end
