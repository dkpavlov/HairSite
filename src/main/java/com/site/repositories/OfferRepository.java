package com.site.repositories;

import com.site.models.Offer;
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

public interface OfferRepository extends PagingAndSortingRepository<Offer, Long> {
    public Page<Offer> findByStatusNot(Status status, Pageable pageable);
    public Page<Offer> findByStatus(Status status, Pageable pageable);
    public Page<Offer> findById(Long id, Pageable pageable);
}
