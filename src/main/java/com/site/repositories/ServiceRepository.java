package com.site.repositories;

import com.site.models.Service;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/15/15
 * Time: 15:38
 */

public interface ServiceRepository extends PagingAndSortingRepository<Service, Long> {
    public Page<Service> findByStatus(Status status, Pageable pageable);
    public Page<Service> findByStatusNot(Status status, Pageable pageable);
    public Page<Service> findById(Long id, Pageable pageable);
}
