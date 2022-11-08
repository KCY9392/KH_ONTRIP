package ontrip.domain.image.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor

public class Image {

    private int fNo; // 파일번호(PK) // SQL : FILE_NO // NUMBER
    private String plcCode; // 시설코드(FK) // SQL : PLC_CODE // CHAR(2)
    private int rBno; // 참조게시글번호 // SQL : FILE_NAME // VARCHAR2(20)
    private String fName; // 파일명 // SQL : FILE_NAME // VARCHAR2(20)
    private String fPath; // 저장폴더경로 // SQL : FILE_PATH // VARCHAR2(100)
    private Date uploadDate; // 업로드일 // SQL : UPLOAD_DATE // DATE(SYSDATE)
    private int fLevel; // 파일레벨 // SQL : FILE_LEVEL // NUMBER
    private String iStatus; // 삭제여부 // SQL : IMG_STATUS // VARCHAR2(1) // DEFAULT 'N'

}
