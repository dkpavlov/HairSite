package com.site.repositories;

import com.site.models.ServiceItem;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by dkpavlov on 8/10/16.
 */
public interface ServiceItemRepository extends PagingAndSortingRepository<ServiceItem, Long> {
    public Page<ServiceItem> findByStatusNot(Status status, Pageable pageable);
}
