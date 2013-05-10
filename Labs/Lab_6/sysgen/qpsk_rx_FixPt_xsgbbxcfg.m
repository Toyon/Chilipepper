
 function qpsk_rx_FixPt_xsgbbxcfg(this_block)
 % Set target language
 this_block.setTopLevelLanguage('VHDL');
 % Set top entity name
 this_block.setEntityName('qpsk_rx_FixPt');
 % Set the combinational flag
 this_block.tagAsCombinational;
 % Set inport names
 this_block.addSimulinkInport('reset');
 this_block.addSimulinkInport('i_in');
 this_block.addSimulinkInport('q_in');
 this_block.addSimulinkInport('mu_foc_in');
 this_block.addSimulinkInport('mu_toc_in');
 % Set outport names and types
 this_block.addSimulinkOutport('ce_out');
 ce_out_obj = this_block.port('ce_out');
 ce_out_obj.setType('UFix_1_0');
 this_block.port('ce_out').useHDLVector(false);
 this_block.addSimulinkOutport('r_out');
 r_out_obj = this_block.port('r_out');
 r_out_obj.setType('Fix_12_0');
 this_block.addSimulinkOutport('s_f_out_re');
 s_f_out_re_obj = this_block.port('s_f_out_re');
 s_f_out_re_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('s_f_out_im');
 s_f_out_im_obj = this_block.port('s_f_out_im');
 s_f_out_im_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('s_c_out_re');
 s_c_out_re_obj = this_block.port('s_c_out_re');
 s_c_out_re_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('s_c_out_im');
 s_c_out_im_obj = this_block.port('s_c_out_im');
 s_c_out_im_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('s_t_out_re');
 s_t_out_re_obj = this_block.port('s_t_out_re');
 s_t_out_re_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('s_t_out_im');
 s_t_out_im_obj = this_block.port('s_t_out_im');
 s_t_out_im_obj.setType('Fix_26_12');
 this_block.addSimulinkOutport('t_est_out');
 t_est_out_obj = this_block.port('t_est_out');
 t_est_out_obj.setType('Fix_20_12');
 this_block.addSimulinkOutport('f_est_out');
 f_est_out_obj = this_block.port('f_est_out');
 f_est_out_obj.setType('Fix_26_12');
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
	 if(this_block.port('mu_foc_in').width ~= 12)
		 this_block.setError('Input data type for port "mu_foc_in" must have width = 12.');
	 end
	 if(this_block.port('mu_toc_in').width ~= 12)
		 this_block.setError('Input data type for port "mu_toc_in" must have width = 12.');
	 end
 end
 
 if (this_block.inputRatesKnown)
	 setup_rates(this_block,'clk','ce', 1);
 end
 %s Add HDL files
 this_block.addFile('hdl\qpsk_rx_FixPt_pkg.vhd');
 this_block.addFile('hdl\qpsk_rx_FixPt.vhd');
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
