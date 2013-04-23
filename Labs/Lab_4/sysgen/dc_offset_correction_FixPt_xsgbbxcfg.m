
 function dc_offset_correction_FixPt_xsgbbxcfg(this_block)
 % Set target language
 this_block.setTopLevelLanguage('VHDL');
 % Set top entity name
 this_block.setEntityName('dc_offset_correction_FixPt');
 % Set the combinational flag
 this_block.tagAsCombinational;
 % Set inport names
 this_block.addSimulinkInport('reset');
 this_block.addSimulinkInport('i_in');
 this_block.addSimulinkInport('q_in');
 this_block.addSimulinkInport('alpha_in');
 this_block.addSimulinkInport('gain_en_in');
 this_block.addSimulinkInport('rssi_low_goal_in');
 this_block.addSimulinkInport('rssi_high_goal_in');
 this_block.addSimulinkInport('rx_en_in');
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
 this_block.addSimulinkOutport('rssi_out');
 rssi_out_obj = this_block.port('rssi_out');
 rssi_out_obj.setType('UFix_24_0');
 this_block.addSimulinkOutport('rssi_en_out');
 rssi_en_out_obj = this_block.port('rssi_en_out');
 rssi_en_out_obj.setType('UFix_1_0');
 this_block.port('rssi_en_out').useHDLVector(false);
 this_block.addSimulinkOutport('dir_out');
 dir_out_obj = this_block.port('dir_out');
 dir_out_obj.setType('UFix_2_0');
 this_block.addSimulinkOutport('dir_en_out');
 dir_en_out_obj = this_block.port('dir_en_out');
 dir_en_out_obj.setType('UFix_1_0');
 this_block.port('dir_en_out').useHDLVector(false);
 this_block.addSimulinkOutport('d1');
 d1_obj = this_block.port('d1');
 d1_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('d2');
 d2_obj = this_block.port('d2');
 d2_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('d3');
 d3_obj = this_block.port('d3');
 d3_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('d4');
 d4_obj = this_block.port('d4');
 d4_obj.setType('UFix_24_0');
 this_block.addSimulinkOutport('d5');
 d5_obj = this_block.port('d5');
 d5_obj.setType('UFix_24_0');
 this_block.addSimulinkOutport('d6');
 d6_obj = this_block.port('d6');
 d6_obj.setType('UFix_1_0');
 this_block.port('d6').useHDLVector(false);
 this_block.addSimulinkOutport('d7');
 d7_obj = this_block.port('d7');
 d7_obj.setType('UFix_1_0');
 this_block.port('d7').useHDLVector(false);
 this_block.addSimulinkOutport('d8');
 d8_obj = this_block.port('d8');
 d8_obj.setType('UFix_2_0');
 this_block.addSimulinkOutport('d9');
 d9_obj = this_block.port('d9');
 d9_obj.setType('UFix_1_0');
 this_block.port('d9').useHDLVector(false);
 % Set inport types and types are known
 if (this_block.inputTypesKnown)
	 if(this_block.port('reset').width ~= 1)
		 this_block.setError('Input data type for port "reset" must have width = 1.');
	 end
	 this_block.port('reset').useHDLVector(false);
	 if(this_block.port('i_in').width ~= 12)
		 this_block.setError('Input data type for port "i_in" must have width = 12.');
	 end
	 if(this_block.port('q_in').width ~= 12)
		 this_block.setError('Input data type for port "q_in" must have width = 12.');
	 end
	 if(this_block.port('alpha_in').width ~= 12)
		 this_block.setError('Input data type for port "alpha_in" must have width = 12.');
	 end
	 if(this_block.port('gain_en_in').width ~= 1)
		 this_block.setError('Input data type for port "gain_en_in" must have width = 1.');
	 end
	 this_block.port('gain_en_in').useHDLVector(false);
	 if(this_block.port('rssi_low_goal_in').width ~= 24)
		 this_block.setError('Input data type for port "rssi_low_goal_in" must have width = 24.');
	 end
	 if(this_block.port('rssi_high_goal_in').width ~= 24)
		 this_block.setError('Input data type for port "rssi_high_goal_in" must have width = 24.');
	 end
	 if(this_block.port('rx_en_in').width ~= 1)
		 this_block.setError('Input data type for port "rx_en_in" must have width = 1.');
	 end
	 this_block.port('rx_en_in').useHDLVector(false);
 end
 
 if (this_block.inputRatesKnown)
	 setup_rates(this_block,'clk','ce', 1);
 end
 %s Add HDL files
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_4_A\MATLAB\codegen\dc_offset_correction\hdlsrc\dc_offset_correction_FixPt_pkg.vhd');
 this_block.addFile('C:\GIT\Chilipepper\Labs\Lab_4_A\MATLAB\codegen\dc_offset_correction\hdlsrc\dc_offset_correction_FixPt.vhd');
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
