package ontrip.domain.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor

public class Payment {

    private int card_No; // 카드 후원 번호 // SQL : CARD_NO // NUMBER
    private String company; // 카드사 // SQL : COMPANY // VARCHAR2(100)
    private String card_Num; // 카드번호 // SQL : CARD_NUM // VARCHAR2(100)
    private String validity; // 카드유효기간 // SQL : VALIDITY // DATE

}
