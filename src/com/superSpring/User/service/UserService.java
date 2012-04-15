package com.superSpring.User.service;

import com.superSpring.User.domain.UserVO;
import com.superSpring.User.exception.UserException;

import java.util.List;

public interface UserService {
    /**
     * log in service
     *
     * @param user user
     * @return User instance from database
     * @throws UserException on error
     */
    public UserVO logIn(UserVO user) throws UserException;

    /**
     * getAllUserDetails to list all user details
     *
     * @return List of User
     * @throws UserException on error
     */
    public List<UserVO> getAllUserDetails() throws UserException;

    /**
     * create new user
     *
     * @param user user
     * @throws UserException on error
     */
    public void addNewUser(UserVO user) throws UserException;

    /**
     * getUserDetailsFromID to get the single user details from its id
     *
     * @param id id
     * @return UserVO
     * @throws UserException on error
     */
    public UserVO getUserDetailsFromID(Long id) throws UserException;

    /**
     * updates the current user
     *
     * @param user user
     * @throws UserException on error
     */
    public void UpdateUser(UserVO user) throws UserException;

    /**
     * deletes the selected user
     *
     * @param id id of the user
     * @throws UserException on error
     */
    public void deleteUser(Long id) throws UserException;
}
