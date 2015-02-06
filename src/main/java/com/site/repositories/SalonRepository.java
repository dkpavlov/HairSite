package com.site.repositories;

import com.site.models.Salon;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:32
 */

public interface SalonRepository extends PagingAndSortingRepository<Salon, Long> {
}
