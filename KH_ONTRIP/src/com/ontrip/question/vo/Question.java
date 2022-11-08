package ontrip.domain.question.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter
@AllArgsConstructor
public class Question {

    private int qCount;

    private String qCode;

    private String qContent;

    private String status;

    private String qTitle;


    private Date qDate;




}
