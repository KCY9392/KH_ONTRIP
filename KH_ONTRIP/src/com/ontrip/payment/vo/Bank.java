package ontrip.domain.payment.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor

public class Bank {

    private int transfer_No; // 이체후원번호 // SQL : TRANSFER_NO // NUMBER
    private String bank; // 은행 // SQL : BANK // VARCHAR2(100)
    private String name; // 예금주명 // SQL : NAME // VARCHAR2(100)
    private String account_Number; // 계좌번호 // SQL : ACCOUNT_NUMBER // VARCHAR2(100)

}
