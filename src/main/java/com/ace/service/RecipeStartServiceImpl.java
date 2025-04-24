package com.ace.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ace.util.OpcDataMap;

@Service
public class RecipeStartServiceImpl implements RecipeStartService {

    public void recipeStart() throws InterruptedException, ExecutionException {
        OpcDataMap opcData = new OpcDataMap();

        // 레시피 시작 신호
        opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.start_bt_M8001", true);

        // 타이머 초기화 (분, 초, realTime)
        opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", (short) 0);
        opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setSeconds", (short) 0);
        opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", (short) 0);

        Thread.sleep(5000);

        // 시작 신호 해제
        opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.PROGRAMMER.start_bt_M8001", false);
    }

    @Override
    @Scheduled(fixedRate = 1000) // 1초마다 실행
    public void timerStart() throws InterruptedException, ExecutionException {
        OpcDataMap opcData = new OpcDataMap();

        String startVal = "false";
        String resetVal = "false";

        // OPC 상태 읽기
        Map<String, Object> startValMap     = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.start");
        Map<String, Object> resetValMap     = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.reset");
        Map<String, Object> delayTimeValMap = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.delayTime");  // 설정시간 (분)
        Map<String, Object> setMinValMap    = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes"); // 남은분 (분)
        Map<String, Object> setSecValMap    = opcData.getOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setSeconds"); // 남은초 (초)

        startVal = startValMap.get("value").toString();
        resetVal = resetValMap.get("value").toString();

        short minutes = Short.parseShort(setMinValMap.get("value").toString());
        short seconds = Short.parseShort(setSecValMap.get("value").toString());

        if ("false".equals(resetVal)) {
            // Start 신호 감지 시, delayTime 설정 후 Start 비트 리셋
            if ("true".equals(startVal)) {
                short delayTime = Short.parseShort(delayTimeValMap.get("value").toString());
                // 분 단위로 저장
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", delayTime);
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setSeconds", (short) 0);
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", delayTime);
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.start", false);

                minutes = delayTime;
                seconds = 0;
            }

            // 타이머 감소 로직 (분초)
            if (minutes > 0 || seconds > 0) {
                if (seconds > 0) {
                    seconds -= 1;
                } else if (minutes > 0) {
                    minutes -= 1;
                    seconds = 59;
                }

                // OPC에 업데이트
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", minutes);
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setSeconds", seconds);
                opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", minutes);

                // 시간이 다 되었으면 레시피 시작
                if (minutes == 0 && seconds == 0) {
                    recipeStart();
                }
            }

        } else if ("true".equals(resetVal)) {
            // Reset 상태 시 타이머 초기화
            opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setMinutes", (short) 0);
            opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.setSeconds", (short) 0);
            opcData.setOpcData("DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC.realTime", (short) 0);
        }
    }
}
