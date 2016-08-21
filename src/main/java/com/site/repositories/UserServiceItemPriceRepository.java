package com.site.repositories;

import com.site.models.UserServiceItemPrice;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
public interface UserServiceItemPriceRepository extends PagingAndSortingRepository<UserServiceItemPrice, Long> {
    public List<UserServiceItemPrice> findByUserUsername(String username);
}
