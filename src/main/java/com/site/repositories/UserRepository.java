package com.site.repositories;

import com.site.models.User;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface UserRepository extends PagingAndSortingRepository<User, Long> {
    public User findByUsername(String username);
    public List<User> findByRole(String role);
}