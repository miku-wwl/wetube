package com.weilai.wetube.repository;

import com.weilai.wetube.entity.UserFollowing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserFollowingRepository extends JpaRepository<UserFollowing, Long> {

    // 删除用户的关注关系
    @Modifying
    @Query(value = "DELETE FROM t_user_following WHERE user_id = :userId AND following_id = :followingId",
            nativeQuery = true)
    void deleteUserFollowing(@Param("userId") Long userId, @Param("followingId") Long followingId);

    // 添加用户的关注关系
    @Override
    <S extends UserFollowing> S save(S entity);

    // 获取用户关注列表
    @Query(value = "SELECT * FROM t_user_following WHERE user_id = :userId",
            nativeQuery = true)
    List<UserFollowing> getUserFollowings(@Param("userId") Long userId);

    // 获取用户的粉丝列表
    @Query(value = "SELECT * FROM t_user_following WHERE following_id = :followingId",
            nativeQuery = true)
    List<UserFollowing> getUserFans(@Param("followingId") Long followingId);
}
