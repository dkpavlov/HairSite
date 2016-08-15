package com.site.repositories;

import com.site.models.ServiceItem;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by dkpavlov on 8/10/16.
 */
public interface ServiceItemRepository extends PagingAndSortingRepository<ServiceItem, Long> {
}
