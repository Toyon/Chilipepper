function make_trig_lut
    % Generate LUT values
    ii = 0:(400-1);
    c = cos(2*pi*ii/400);
    s = sin(2*pi*ii/400);

    % Create cosine LUT
    fid = fopen('COS.m','w+');
    fprintf(fid,'function y = COS\n');
    fprintf(fid,'%%#codegen\n');
    fprintf(fid,'y = [\n');
    fprintf(fid,'%14.12f\n',c);
    fprintf(fid,'];\n');
    fclose(fid);

    % Create sine LUT
    fid = fopen('SIN.m','w+');
    fprintf(fid,'function y = SIN\n');
    fprintf(fid,'%%#codegen\n');
    fprintf(fid,'y = [\n');
    fprintf(fid,'%14.12f\n',s);
    fprintf(fid,'];\n');
    fclose(fid);
end