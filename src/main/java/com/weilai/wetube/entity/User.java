package com.weilai.wetube.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "t_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100, nullable = true)
    private String phone;

    @Column(length = 100, nullable = true)
    private String email;

    @Column(length = 255, nullable = true)
    private String password;

    @Column(length = 50, nullable = true)
    private String salt;

    @Column(name = "createTime", nullable = true)
    private LocalDateTime createTime;

    @Column(name = "updateTime", nullable = true)
    private LocalDateTime updateTime;

    @Transient
    private UserInfo userInfo;
}