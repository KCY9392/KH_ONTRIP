package ontrip.domain.price.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor
public class Price {
    private String rnCode;
    private String pRoomType;
    private int price;
}
