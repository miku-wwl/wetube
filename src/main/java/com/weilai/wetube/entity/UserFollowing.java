package com.weilai.wetube.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "t_user_following")
public class UserFollowing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "following_id")
    private Long followingId;

    @Column(name = "group_id")
    private Long groupId;

    @Column(name = "create_time")
    private LocalDateTime createTime;

    @Transient
    private UserInfo userInfo;
}