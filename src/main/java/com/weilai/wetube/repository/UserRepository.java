package com.weilai.wetube.repository;

import com.weilai.wetube.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.time.LocalDateTime;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByPhone(String phone);

    @Modifying
    @Query(value = "UPDATE t_user SET phone = :phone, email = :email, password = :password, update_time = :updateTime WHERE id = :id",
            nativeQuery = true)
    void updateUser(@Param("phone") String phone, @Param("email") String email,
                    @Param("password") String password, @Param("updateTime") LocalDateTime updateTime,
                    @Param("id") Long id);


    Optional<User> findByPhoneOrEmail(@Param("phone") String phone, @Param("email") String email);
}
