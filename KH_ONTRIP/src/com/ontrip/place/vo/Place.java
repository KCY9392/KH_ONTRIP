package ontrip.domain.place.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor

public class Place {

    private String plcCode; // 시설코드(PK) // SQL : PLC_CODE // CHAR(2)
    private int categoryCode; // 카테고리코드(FK) // SQL : CATEGORY_ID // CHAR(2)
    private String localCode; // 지역코드(FK) // SQL : LOCAL_CODE // CHAR(2)
    private String dareaCode; // 상세지역코드(FK) // SQL : DA_CODE // CHAR(3)
    private String plcName; // 시설이름 // SQL : PLC_NAME // VARCHAR2(20)
    private String plcAddress; // 시설주소 // SQL : PLC_ADDRESS // VARCHAR2(50)
    private String plcText; // 시설설명텍스트 // SQL : PLC_TEXT // VARCHAR2(100)
    private String plcBname; // 시설대표자 // SQL : PLC_BNAME // VARCHAR2(20)
    private String plcPnumber; // 시설전화번호 // SQL : PLC_PNUMBER // VARCHAR2(13)
    private Date plcDate; // 시설등록날짜 // SQL : PLC_DATE // DATE(SYSDATE)
    private int plcLa; // 시설위도 // SQL : PLC_LA // NUMBER
    private int plcLo; // 시설경도 // SQL : PLC_LO // NUMBER
    private String status; // 삭제여부 // SQL : STATUS // VARCHAR2(1) // DEFAULT 'N'


}

