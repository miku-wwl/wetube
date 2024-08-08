package com.weilai.wetube.service;

import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.util.StringUtils;

import com.weilai.wetube.domain.PageResult;
import com.weilai.wetube.domain.constant.UserConstant;
import com.weilai.wetube.domain.exception.ConditionException;
import com.weilai.wetube.entity.User;
import com.weilai.wetube.entity.UserInfo;
import com.weilai.wetube.repository.UserInfoRepository;
import com.weilai.wetube.repository.UserRepository;
import com.weilai.wetube.util.DateUtil;
import com.weilai.wetube.util.MD5Util;
import com.weilai.wetube.util.RSAUtil;
import com.weilai.wetube.util.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserInfoRepository userInfoRepository;

    public void addUser(User user) {
        String phone = user.getPhone() == null ? "" : user.getPhone();
        String email = user.getEmail() == null ? "" : user.getEmail();
        if (StringUtils.isNullOrEmpty(phone) && StringUtils.isNullOrEmpty(email)) {
            throw new ConditionException("参数异常！");
        }
        Optional<User> dbUser = userRepository.findByPhoneOrEmail(phone, email);

        if (dbUser.isPresent()) {
            throw new ConditionException("该手机号已经注册！");
        }
        Date now = new Date();
        String salt = String.valueOf(now.getTime());
        String password = user.getPassword();
        String rawPassword;
        try {
            rawPassword = RSAUtil.decrypt(password);
        } catch (Exception e) {
            throw new ConditionException("密码解密失败！");
        }
        String md5Password = MD5Util.sign(rawPassword, salt, "UTF-8");
        user.setSalt(salt);
        user.setPassword(md5Password);
        user.setCreateTime(DateUtil.dateToLocalDateTime(now));
        userRepository.save(user);
        //添加用户信息
        UserInfo userInfo = new UserInfo();
        userInfo.setUserId(user.getId());
        userInfo.setNick(UserConstant.DEFAULT_NICK);
        userInfo.setBirth(UserConstant.DEFAULT_BIRTH);
        userInfo.setGender(UserConstant.GENDER_MALE);
        userInfo.setCreateTime(DateUtil.dateToLocalDateTime(now));
        userInfoRepository.save(userInfo);
    }

    public User getUserByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }

    public String login(User user) throws Exception {
        String phone = user.getPhone();
        if (StringUtils.isNullOrEmpty(phone)) {
            throw new ConditionException("手机号不能为空！");
        }
        User dbUser = this.getUserByPhone(phone);
        if (dbUser == null) {
            throw new ConditionException("当前用户不存在！");
        }
        String password = user.getPassword();
        String rawPassword;
        try {
            rawPassword = RSAUtil.decrypt(password);
        } catch (Exception e) {
            throw new ConditionException("密码解密失败！");
        }
        String salt = dbUser.getSalt();
        String md5Password = MD5Util.sign(rawPassword, salt, "UTF-8");
        if (!md5Password.equals(dbUser.getPassword())) {
            throw new ConditionException("密码错误！");
        }
        return TokenUtil.generateToken(dbUser.getId());
    }

    public User getUserInfo(Long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            log.info("User with ID {} not found.", userId);
            return null;
        }
        UserInfo userInfo = userInfoRepository.findByUserId(userId);
        user.setUserInfo(userInfo);
        return user;
    }


    public void updateUsers(User user) throws Exception {
        Long id = user.getId();
        Optional<User> dbUser = userRepository.findById(id);

        if (dbUser.isEmpty()) {
            throw new ConditionException("用户不存在！");
        }
        if (!StringUtils.isNullOrEmpty(user.getPassword())) {
            String rawPassword = RSAUtil.decrypt(user.getPassword());
            String md5Password = MD5Util.sign(rawPassword, dbUser.get().getSalt(), "UTF-8");
            user.setPassword(md5Password);
        }
        Date now = new Date();
        user.setUpdateTime(DateUtil.dateToLocalDateTime(now));
        log.info("[updateUsers] userRepository.updateUser user:{}", user);
        userRepository.updateUser(user.getPhone(), user.getEmail(), user.getPassword(), user.getUpdateTime(),
                user.getId());
    }

    public void updateUserInfos(UserInfo userInfo) {
        Date now = new Date();
        userInfo.setUpdateTime(DateUtil.dateToLocalDateTime(now));
        userInfoRepository.updateUserInfos(userInfo.getNick(), userInfo.getAvatar(), userInfo.getSign(),
                userInfo.getBirth(), userInfo.getGender(), userInfo.getUpdateTime(), userInfo.getUserId());
    }

    public User getUserById(Long followingId) {
        return userRepository.getById(followingId);
    }

    public List<UserInfo> getUserInfoByUserIds(Set<Long> userIdList) {
        return userInfoRepository.getUserInfoByUserIds(userIdList);
    }

    public PageResult<UserInfo> pageListUserInfos(JSONObject params) {
        Integer no = params.getInteger("no");
        Integer size = params.getInteger("size");
        params.put("start", (no - 1) * size);
        params.put("limit", size);

        Integer total = userInfoRepository.pageCountUserInfos(params.getString("nick"));
        List<UserInfo> list = new ArrayList<>();
        if (total > 0) {
            list = userInfoRepository.pageListUserInfos(params.getString("nick"), (no - 1) * size, size);
        }
        return new PageResult<>(total, list);
    }
}