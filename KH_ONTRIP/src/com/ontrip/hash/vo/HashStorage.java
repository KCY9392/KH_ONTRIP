package ontrip.domain.hash.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor
public class HashStorage {
    private String plcCode; // 시설 코드
    private int hashNo; // 해시 코드
}
