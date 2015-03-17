package com.site.repositories;

import com.site.models.Product;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 13:32
 */

public interface ProductRepository extends PagingAndSortingRepository<Product, Long> {
    public Page<Product> findByStatus(Status status, Pageable pageable);
}
