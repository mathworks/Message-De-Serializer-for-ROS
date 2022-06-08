function [ y, jj_out ] = rosmsgSerializeStruct(msg, packed, jj)
%rosmsgSerializeStruct Serialize a message structure into a byte stream

%   Copyright 2017 The MathWorks, Inc.

%#codegen

p = fieldnames(msg);

for ii = 1:numel(p)
    name = char(p{ii});
    msg_len = length(msg);
    for kk = 1:msg_len
        obj = msg(kk).(name);
        if isstruct(obj)
            [packed, jj] = rosmsgSerializeStruct(obj, packed, jj);
        else
            new_vec = typecast(obj, 'uint8');
            numel_new_vec = numel(new_vec);
            new_vec_len = typecast(numel_new_vec, 'uint8');

            if iscolumn(new_vec_len)
                %packed = horzcat(packed, new_vec_len');
                packed(jj:jj+8-1) = new_vec_len';
            else
                %packed = horzcat(packed, new_vec_len);
                packed(jj:jj+8-1) = new_vec_len;
            end

            jj = jj + 8;

            if iscolumn(new_vec)
                %packed = horzcat(packed, new_vec');
                packed(jj:jj+numel_new_vec-1) = new_vec';
            else
                packed(jj:jj+numel_new_vec-1) = new_vec;
            end

            jj = jj + numel_new_vec;
        end
    end
end

y = packed;
jj_out = jj;

end
