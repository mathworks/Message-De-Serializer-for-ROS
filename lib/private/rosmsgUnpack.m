function [ msg_out ] = rosmsgUnpack( arr, msg_in )
%rosmsgUnpack Populate a structure based on a byte array

%   Copyright 2017 The MathWorks, Inc.

%#codegen

msg_out = inject_data(msg_in, arr, 1);

end

function [msg_out, depth_out] = inject_data(msg, inarr, jj)
p = fieldnames(msg);
for ii = 1:numel(p)
    name = char(p{ii});
    obj = msg.(name);
    
    if isstruct(obj)
        [msg.(name), jj] = inject_data(obj, inarr, jj);
    else
        leaf_len = typecast(inarr(jj:jj+8-1), 'double');
        jj = jj + 8;
        c = class(msg.(name));
        temp = typecast(inarr(jj:jj+leaf_len(1)-1), c);
        msg.(name) = temp(1:numel(msg.(name)));
        jj = jj + leaf_len(1);
    end
end
msg_out = msg;
depth_out = jj;
end