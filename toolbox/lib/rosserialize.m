classdef rosserialize < matlab.System & matlab.system.mixin.Propagates
    %rosserialize Serialize a ROS message into a byte array
    %
    %   This system object serializes a ROS message into a byte array. This
    %   byte array can then be sent over a non-ROS communication channel,
    %   e.g. a UDP or serial channel.
    %
    %   Use the rosdeserialize system object to reverse the process.
    %
    %   See also rosdeserialize.
    %
    %   Copyright 2017 The MathWorks, Inc.
    
    %#codegen
    
    properties(Logical, Nontunable)
        fixedSize = true; % Use fixed output size (for code generation)
    end
    
    properties(Nontunable)
        maxSizeBytes = 2048; % Maximum message size in bytes
    end
    
    methods(Access = protected)
        function dataout = getOutputDataTypeImpl(~)
            dataout = 'uint8';
        end
        
        function outVarBool = isOutputFixedSizeImpl(obj)
            outVarBool = obj.fixedSize;
        end
        
        function maxSize = getOutputSizeImpl(obj)
            maxSize = [1,obj.maxSizeBytes];
        end
        
        function Data = stepImpl(obj, Msg)            
            packed = uint8(zeros([1,obj.maxSizeBytes]));
            [y_intermediate, jj_final] = rosmsgSerializeStruct(Msg, packed, 1);
            
            if obj.fixedSize
                Data = y_intermediate;
            else
                Data = y_intermediate(1,1:jj_final-1);
            end
        end
    end
end