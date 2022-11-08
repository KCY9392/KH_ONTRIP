package ontrip.domain.heart.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter@AllArgsConstructor
public class Heart {
    private int memberCode; // 회원번호 (PK) // SQL : MEM_NO2    // VARCHAR2(20)
    private int playCode;   // 시설코드 (FK) // SQL : PLC_CODE   // VARCHAR2(20)
    private Date heartDate; // 찜한날짜      // SQL : HEART_DATE // VARCHAR2(20)
}
