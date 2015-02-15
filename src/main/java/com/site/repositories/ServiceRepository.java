package com.site.repositories;

import com.site.models.Service;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/15/15
 * Time: 15:38
 */

public interface ServiceRepository extends PagingAndSortingRepository<Service, Long> {
}
