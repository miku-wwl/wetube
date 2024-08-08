package com.weilai.wetube.repository;

import com.weilai.wetube.entity.FollowingGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface FollowingGroupRepository extends JpaRepository<FollowingGroup, Long> {

    FollowingGroup findByType(String type);

    Optional<FollowingGroup> findById(Long id);

    List<FollowingGroup> findByUserIdOrTypeIn(Long userId, List<String> types);

    List<FollowingGroup> findByUserId(Long userId);

}