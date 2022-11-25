package com.ontrip.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;


/**
 * 첨부파일 업로드 시, 파일명을 변경해서 서버로 업로드하기위한 클래스
 */
public class MyFileRenamePolicy implements FileRenamePolicy{

    // 반드시 미완성된 rename메소드를 오버라이딩해서 구현해야함
    // 기존의 파일을 전달받아서 파일명 수정작업 후에 수정된 파일을 반환해주는 메소드
    
    @Override
    public File rename(File originFile) {
        
        // 원본파일명 ( "aaa.jpg" )
        String originName = originFile.getName();
        
        // 수정파일명 : 파일업로드된 시간(년월일시분초) + 5자리 랜덤값 => 최대한 이름이 안겹치게
        // 확장자 : 원본파일의 확장자 그대로.
        
        // 원본명                =>         수정명
        // aaa.jpg             =>   2022101719265511111.jpg
        
        // 1. 파일업로드된 시간(년,월,일,시,분,초) -> String currentTime;
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        
        // 2. 5자리 랜덤값 => int ranNum
        int ranNum = (int)(Math.random() * 90000 + 10000);
        
        // 3. 원본파일의 확장자 추출.
        // 파일명 중간에 .이 들어가는 경우를 생각하고 마지막 .의 위치에서 추출하기
        
        String ext = originName.substring(originName.lastIndexOf("."));
        
        String changeName = currentTime + ranNum + ext;
        
        // 원본파일(originFile)을 수정된 파일명으로 적용시켜서 파일객체로 반환
        return new File(originFile.getParent(), changeName);
        
    }
    
}
