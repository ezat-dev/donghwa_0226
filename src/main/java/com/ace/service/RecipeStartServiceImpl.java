package com.ace.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Service;

import com.ace.controller.MainController;
import com.ace.util.OpcDataMap;

@Service
public class RecipeStartServiceImpl implements RecipeStartService{


	
	public void recipeStart() throws InterruptedException, ExecutionException {
		OpcDataMap opcData = new OpcDataMap();
		
		opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.PROGRAMMER.start_bt", true);

		opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", (short)0);
		opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", (short)0);
		
		Thread.sleep(5000);
		
		opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.PROGRAMMER.start_bt", false);
	}
	
	
	@Override
	public void timerStart() throws InterruptedException, ExecutionException {
		
		OpcDataMap opcData = new OpcDataMap();
		StringBuffer desc = new StringBuffer();
		
		String startVal = "false";
		String resetVal = "false";
		
		//1. start 비트 체크
		Map<String, Object> startValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.start");
		Map<String, Object> resetValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.reset");
		Map<String, Object> delayTimeValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.delayTime");	//D7825(설정시간)
		Map<String, Object> realTimeValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime");	//가상(진행시간)
		Map<String, Object> setMinutesValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes");	//가상(진행시간)
		
		
		startVal = startValMap.get("value").toString();
		resetVal = resetValMap.get("value").toString();
		
		short setMinutes = (short) (Integer.parseInt(setMinutesValMap.get("value").toString()));
		short realTimeValVal = (short) Integer.parseInt(realTimeValMap.get("value").toString());
		//2. start비트 ON 이면서 delayTime 0이 아니면 년월일 시분초 기록
//		System.out.println(startVal);
		if("false".equals(resetVal)) {
			if("true".equals(startVal)) {
				opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes",(short) (Integer.parseInt((delayTimeValMap.get("value").toString()))*60));
				opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.start", false);
			}
			
			if(setMinutes > 0) {
				//3. 1초주기로 진행시간 realTime 기록
//				setMinutesValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes");
//				setMinutes = (short) (Integer.parseInt(setMinutesValMap.get("value").toString()));
//				System.out.println(setMinutes);
				
				setMinutes -= 1;
				
				realTimeValVal = setMinutes;
				
				opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", realTimeValVal);
				opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", setMinutes);
				
				realTimeValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime");	//D7825(설정시간)
				realTimeValVal = (short) Integer.parseInt(realTimeValMap.get("value").toString());
				
				//4. realTime이 0이면 레시피 start				
				if(realTimeValVal == 0) {
//					System.out.println("realTime : "+realTimeValVal);
					recipeStart();
				}
								
			}

		}else if("true".equals(resetVal)) {
			opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", (short)0);
			opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", (short)0);
			
			
		}
	}

}
