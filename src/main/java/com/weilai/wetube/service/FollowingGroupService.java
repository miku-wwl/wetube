package com.weilai.wetube.service;

import com.weilai.wetube.entity.FollowingGroup;
import com.weilai.wetube.repository.FollowingGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class FollowingGroupService {

    @Autowired
    private FollowingGroupRepository followingGroupRepository;

    public FollowingGroup getByType(String type) {
        return followingGroupRepository.findByType(type);
    }

    public FollowingGroup getById(Long id) {
        return followingGroupRepository.findById(id).orElse(null);
    }

    public List<FollowingGroup> getByUserId(Long userId) {
        Optional<FollowingGroup> followingGroup = followingGroupRepository.findById(userId);
        // 如果 Optional 有值，则将其放入一个大小为 1 的列表中
        // 否则返回一个空列表
        return followingGroup.map(Collections::singletonList).orElse(Collections.emptyList());
    }


    public void addFollowingGroup(FollowingGroup followingGroup) {
        followingGroupRepository.save(followingGroup);
    }

    public List<FollowingGroup> getUserFollowingGroups(Long userId) {
        return followingGroupRepository.findByUserId(userId);
    }
}