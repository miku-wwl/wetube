package com.weilai.wetube.repository;


import com.weilai.wetube.entity.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {
    UserInfo findByUserId(Long userId);

    // Custom method to update user information
    @Modifying
    @Query(value = "UPDATE t_user_info SET "
            + "nick = COALESCE(:nick, nick), "
            + "avatar = COALESCE(:avatar, avatar), "
            + "sign = COALESCE(:sign, sign), "
            + "birth = COALESCE(:birth, birth), "
            + "gender = COALESCE(:gender, gender), "
            + "update_time = :updateTime "
            + "WHERE user_id = :userId",
            nativeQuery = true)
    void updateUserInfos(@Param("nick") String nick, @Param("avatar") String avatar,
                         @Param("sign") String sign, @Param("birth") String birth,
                         @Param("gender") String gender, @Param("updateTime") LocalDateTime updateTime,
                         @Param("userId") Long userId);

    // Custom method to get user information by user IDs
    @Query(value = "SELECT * FROM t_user_info WHERE user_id IN :userIdList",
            nativeQuery = true)
    List<UserInfo> getUserInfoByUserIds(@Param("userIdList") Set<Long> userIdList);

    // Custom method to get the count of user information by nickname
    @Query(value = "SELECT COUNT(*) FROM t_user_info WHERE nick LIKE %:nick%",
            nativeQuery = true)
    Integer pageCountUserInfos(@Param("nick") String nick);

    // Custom method to get a paginated list of user information by nickname
    @Query(value = "SELECT * FROM t_user_info WHERE nick LIKE %:nick% ORDER BY user_id DESC LIMIT :start, :limit",
            nativeQuery = true)
    List<UserInfo> pageListUserInfos(@Param("nick") String nick, @Param("start") int start, @Param("limit") int limit);
}