package com.site.repositories;

import com.site.models.ServiceItem;
import com.site.models.ServiceProduct;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by dkpavlov on 8/20/16.
 */
public interface ServiceProductRepository extends PagingAndSortingRepository<ServiceProduct, Long> {
    public Page<ServiceProduct> findByStatusNot(Status status, Pageable pageable);
}
