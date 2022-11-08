package ontrip.domain.score.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor
public class Score {
    private String reviewCode; // 후기코드(PK)  // SQL : REV_CODE // VARCHAR2(20)
    private int reviewStar;    // 만족도        // SQL : REV_STAR // VARCHAR2(20)
    private int review_c;      // 청결          // SQL : REV_C    // VARCHAR2(20)
    private int review_s;      // 서비스        // SQL : REV_S    // VARCHAR2(20)
    private int review_p;      // 편의          // SQL : REV_P    // VARCHAR2(20)
}
