package com.site.repositories;

import com.site.models.Offering;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-23
 * Time: 13:39
 */

public interface OfferingRepository extends PagingAndSortingRepository<Offering, Long> {
    public Page<Offering> findByStatusNot(Status status, Pageable pageable);
}
