function valueCRC = CheckCRC(msg_in)

valueCRC = 65535;
genPoly = 4129;

ml= length(msg_in);
for i1 = 1:ml
    for i2 = 1:8
        b = mod(floor(msg_in(i1)/(2^(8-i2))),2);
        valueCRCsh1 = bitsll(valueCRC,1);
        valueCRCadd1 = bitor(valueCRCsh1,b);
        if floor(valueCRCadd1/2^16) == 1
            valueCRC = bitxor(valueCRCadd1,genPoly);
        else
            valueCRC = valueCRCadd1;
        end
        valueCRC = mod(valueCRC,2^16);
        dec2hex(valueCRC);
        2;
    end
end

