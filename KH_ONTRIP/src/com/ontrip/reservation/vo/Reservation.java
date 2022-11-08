package ontrip.domain.reservation.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter @Setter @AllArgsConstructor
public class Reservation {
    private String rnCode; //예약 코드
    private String placeCode; // 시설 코드
    private String categoryCode; // 카테고리 코드
    private int memberNo; // 회원 번호
    private String rnName;; // 예약자 명
    private int rnAdult; // 인원(성인) 수
    private int rnChild; // 인원(어린이) 수
    private int rnCount; // 객실 수
    private String rnRoomType; // 객실타입
    private String rnPhoneNumber; // 예약자 휴대폰 번호
    private Date rnCheckIn; // 체크인 날짜
    private Date rnCheckOut; // 체크아웃 날짜
    private Date rnDate; // 예약한 날짜
    private String rnStatus; // 삭제 여부(N, Y)
    private String payment; // 결제수단
    private int price; // 결제금액
}
