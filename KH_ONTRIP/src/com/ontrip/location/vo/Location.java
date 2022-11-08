package ontrip.domain.location.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter@Setter@AllArgsConstructor
public class Location {
    private String localCode; // 지역코드(PK) // SQL : LOCAL_CODE // VARCHAR2(20)
    private String localName; // 지역이름     // SQL : LOCAL_NAME // VARCHAR2(20)
}
