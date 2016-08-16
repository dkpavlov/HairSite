package com.site.utils.validators;

import com.site.models.User;
import com.site.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.jws.soap.SOAPBinding;

/**
 * Created by dkpavlov on 8/10/16.
 * http://howtodoinjava.com/spring/spring-mvc/spring-mvc-custom-validator-example/
 */

@Component("userValidator")
public class UserValidator implements Validator {

    @Autowired
    UserRepository userRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if(user.getUsername() == null || user.getUsername().trim().length() < 3){
            errors.rejectValue("username", "error.username", "Username must be at least 3 characters");
        } else {
            User dbUSer = userRepository.findByUsername(user.getUsername());
            if(dbUSer != null){
                errors.rejectValue("username", "error.username", "Username is taken");
            }
        }
        if(user.getPassword1() == null || user.getPassword1().length() < 3
                ||user.getPassword2() == null || user.getPassword2().length() < 3){
            errors.rejectValue("password1", "error.username1", "Password must be at least 3 characters");
            errors.rejectValue("password2", "error.username2", "Password must be at least 3 characters");
        } else {
            if(!user.getPassword1().equals(user.getPassword2())){
                errors.rejectValue("password2", "error.username2", "Passwords must match");
                errors.rejectValue("password1", "error.username1", "Passwords must match");
            }
        }
    }
}
