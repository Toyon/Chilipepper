
 function qpsk_tx_FixPt_xsgbbxcfg(this_block)
 % Set target language
 this_block.setTopLevelLanguage('VHDL');
 % Set top entity name
 this_block.setEntityName('qpsk_tx_FixPt');
 % Set the combinational flag
 this_block.tagAsCombinational;
 % Set inport names
 this_block.addSimulinkInport('reset');
 this_block.addSimulinkInport('data_in');
 this_block.addSimulinkInport('empty_in');
 this_block.addSimulinkInport('clear_fifo_in');
 this_block.addSimulinkInport('tx_en_in');
 % Set outport names and types
 this_block.addSimulinkOutport('ce_out');
 ce_out_obj = this_block.port('ce_out');
 ce_out_obj.setType('UFix_1_0');
 this_block.port('ce_out').useHDLVector(false);
 this_block.addSimulinkOutport('i_out');
 i_out_obj = this_block.port('i_out');
 i_out_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('q_out');
 q_out_obj = this_block.port('q_out');
 q_out_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('re_byte_out');
 re_byte_out_obj = this_block.port('re_byte_out');
 re_byte_out_obj.setType('UFix_1_0');
 this_block.port('re_byte_out').useHDLVector(false);
 this_block.addSimulinkOutport('tx_done_out');
 tx_done_out_obj = this_block.port('tx_done_out');
 tx_done_out_obj.setType('UFix_1_0');
 this_block.port('tx_done_out').useHDLVector(false);
 % Set inport types and types are known
 if (this_block.inputTypesKnown)
	 if(this_block.port('reset').width ~= 1)
		 this_block.setError('Input data type for port "reset" must have width = 1.');
	 end
	 this_block.port('reset').useHDLVector(false);
	 if(this_block.port('data_in').width ~= 8)
		 this_block.setError('Input data type for port "data_in" must have width = 8.');
	 end
	 if(this_block.port('empty_in').width ~= 1)
		 this_block.setError('Input data type for port "empty_in" must have width = 1.');
	 end
	 this_block.port('empty_in').useHDLVector(false);
	 if(this_block.port('clear_fifo_in').width ~= 1)
		 this_block.setError('Input data type for port "clear_fifo_in" must have width = 1.');
	 end
	 this_block.port('clear_fifo_in').useHDLVector(false);
	 if(this_block.port('tx_en_in').width ~= 1)
		 this_block.setError('Input data type for port "tx_en_in" must have width = 1.');
	 end
	 this_block.port('tx_en_in').useHDLVector(false);
 end
 
 if (this_block.inputRatesKnown)
	 setup_rates(this_block,'clk','ce', 1);
 end
 %s Add HDL files
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_9\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_FixPt_pkg.vhd');
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_9\MATLAB\codegen\qpsk_tx\hdlsrc\SimpleDualPortRAM_1024x8b.vhd');
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_9\MATLAB\codegen\qpsk_tx\hdlsrc\tx_fifo_ram.vhd');
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_9\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_FixPt.vhd');
% ------------------------------------------------------------
function setup_rates(block,clkname,cename,upsamplerate) 
inputRates = block.inputRates; 
uniqueInputRates = unique(inputRates); 
if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
end 
if (uniqueInputRates(end) == Inf) 
    hasConstantInput = true; 
    uniqueInputRates = uniqueInputRates(1:end-1); 
end 
if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
end 
theInputRate = uniqueInputRates(1); 
for i = 1:block.numSimulinkOutports 
    block.outport(i).setRate(theInputRate); 
end 
block.addClkCEPair(clkname,cename,theInputRate/upsamplerate); 
return; 

% ------------------------------------------------------------
