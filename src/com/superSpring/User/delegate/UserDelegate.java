package com.superSpring.User.delegate;

import com.superSpring.User.domain.UserVO;
import com.superSpring.User.exception.UserException;
import com.superSpring.User.service.UserService;

import java.util.List;

/**
 * User: Administrator
 * Date: Nov 27, 2010
 * Time: 12:28:55 PM
 */
public class UserDelegate {

    /**
     * user service instance
     */
    private UserService userService;

    /**
     * spring setter for user service
     *
     * @param userService userService instance
     */
    @SuppressWarnings("unused")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * action for log in
     *
     * @param user user instance
     * @return User instance from database
     * @throws UserException on error
     */
    public UserVO logIn(UserVO user) throws UserException {
        return userService.logIn(user);
    }

    /**
     * getAllUserDetails to list all user details
     *
     * @return List of User
     * @throws UserException on error
     */
    public List<UserVO> getAllUserDetails() throws UserException {
        return userService.getAllUserDetails();
    }

    /**
     * create new user
     *
     * @param user user
     * @throws UserException on error
     */
    public void addNewUser(UserVO user) throws UserException {
        userService.addNewUser(user);
    }

    /**
     * getUserDetailsFromID to get the single user details from its id
     *
     * @param id id
     * @return UserVO
     * @throws UserException on error
     */
    public UserVO getUserDetailsFromID(Long id) throws UserException {
        return userService.getUserDetailsFromID(id);
    }

    /**
     * updates the current user
     *
     * @param user user
     * @throws UserException on error
     */
    public void UpdateUser(UserVO user) throws UserException {
        userService.UpdateUser(user);
    }

    /**
     * deletes the selected user
     *
     * @param id id of the user
     * @throws UserException on error
     */
    public void deleteUser(Long id) throws UserException {
        userService.deleteUser(id);
    }
}
