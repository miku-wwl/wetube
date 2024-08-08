package com.weilai.wetube.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "t_user_info")
public class UserInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = true)
    private Long userId;

    @Column(length = 100, nullable = true)
    private String nick;

    @Column(length = 255, nullable = true)
    private String avatar;

    @Lob
    private String sign;

    @Column(length = 2, nullable = true)
    private String gender;

    @Column(length = 20, nullable = true)
    private String birth;

    @Column(nullable = true)
    private LocalDateTime createTime;

    @Column(nullable = true)
    private LocalDateTime updateTime;

    @Transient
    private Boolean followed;
}
