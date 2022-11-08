package ontrip.domain.member.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter @Setter @AllArgsConstructor
public class Member {

    private int member;
    private String memberId;
    private String memberPwd;
    private String memberName;
    private String gender;
    private String phone;
    private Date birthDate;
    private Boolean unregister;
    private Date enrollDate;
    private Date modifyDate;

}
